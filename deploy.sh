
cd "$(dirname "$0")"



# Stuff to do manually or maybe automate later

# Copy config/hosts into /etc/hosts for spam/bad actor protection
# .gitconfig

# Xcode
# 	xcode-select --install 2>&1 > /dev/null
# 	sudo xcode-select -s /Applications/Xcode.app/Contents/Developer 2>&1 > /dev/null
# 	sudo xcodebuild -license accept 2>&1 > /dev/null

# Brew
#  	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# 	brew tap caskroom/versions
#   brew tap sambadevi/powerlevel9k
#   brew install powerlevel9k mas jq tmux zsh vim wget unrar tmux
#   mas install 587512244 918858936 425264550 1147396723 425424353 1295203466 409201541 803453959 747648890 500154009 509818877 409203825 425955336




prompt_install() {
	echo -n "$1 is not installed. Would you like to install it? (y/n) " >&2
	old_stty_cfg=$(stty -g)
	stty raw -echo
	answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
	stty $old_stty_cfg && echo
	if echo "$answer" | grep -iq "^y" ;then
		# This could def use community support
		if [ -x "$(command -v apt-get)" ]; then
			sudo apt-get install $1 -y

		elif [ -x "$(command -v brew)" ]; then
			brew install $1

		elif [ -x "$(command -v pkg)" ]; then
			sudo pkg install $1

		elif [ -x "$(command -v pacman)" ]; then
			sudo pacman -S $1

		else
			echo "I'm not sure what your package manager is! Please install $1 on your own and run this deploy script again. Tests for package managers are in the deploy script you just ran starting at line 13. Feel free to make a pull request at https://github.com/parth/dotfiles :)"
		fi
	fi
}

check_for_software() {
	echo "Checking to see if $1 is installed"
	if ! [ -x "$(command -v $1)" ]; then
		prompt_install $1
	else
		echo "$1 is installed."
	fi
}

check_default_shell() {
	if [ -z "${SHELL##*zsh*}" ] ;then
			echo "Default shell is zsh."
	else
		echo -n "Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/n)"
		old_stty_cfg=$(stty -g)
		stty raw -echo
		answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
		stty $old_stty_cfg && echo
		if echo "$answer" | grep -iq "^y" ;then
			chsh -s $(which zsh)
		else
			echo "Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
		fi
	fi
}

echo "We're going to do the following:"
echo "On AWS change password so we can change shell to zsh "
echo "sudo passwd ubuntu"
echo "sudo apt-get update -y ; sudo apt-get upgrade -y"
echo "--------"
echo "1. Check to make sure you have zsh, vim, and tmux  installed"
echo "2. We'll help you install them if you don't"
echo "3. We're going to check to see if your default shell is zsh"
echo "4. We'll try to change it if it's not"
echo "5. Copy keys in dir (pubkeys) into authorized_keys"
echo "Let's get started? (y/n)"


old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
	echo
else
	echo "Quitting, nothing was changed."
	exit 0
fi


check_for_software zsh
echo
check_for_software vim
echo
check_for_software tmux
echo


#Add Pub keys to authorized key file
KEYFILE=~/.ssh/authorized_keys
mkdir -p ~/.ssh/
for FILE in ~/dotfiles/pubkeys/*; do
    KEY=`cat $FILE`
    grep -qF -- "$KEY" "$KEYFILE" || echo "$KEY" >> "$KEYFILE"
done

##Add Public keys to authorized_keys files
./add_public_keys.sh

##Make symlinks to config files in home dir
./symlinks.sh



check_default_shell

printf "source '$HOME/dotfiles/zsh/.zshrc'" > ~/.zshrc
printf "so $HOME/dotfiles/vim/.vimrc" > ~/.vimrc
printf "source-file $HOME/dotfiles/tmux/.tmux.conf" > ~/.tmux.conf


