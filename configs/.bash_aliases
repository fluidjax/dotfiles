#Use bashrc as alias to edit this file, once complete it will load any changes
alias bash_aliases='vi ~/.bash_aliases && source ~/.bash_aliases'

#alias t="osascript -e 'tell app \"Terminal\" to do script \"echo \"'"
#alias t="osascript -e 'tell app \"Terminal\" to do script '"
alias t="tmux new -A -s chris"

alias plum="remote_connect plum";
alias fig="remote_connect fig";
alias peach="remote_connect peach";
alias durian="ssh root@192.168.0.140";
alias sim="cd /Users/chris/Library/Application\ Support/iPhone\ Simulator/5.1/Applications"
alias clip="xclip -selection c"
alias of='lsof -nl | grep "/Volumes/Documents" | cut -d " " -f1 | uniq'
alias ls='ls -G'
alias q='cd ~/Development/work/Qredo/qredo_ios_sdk'


#GIT
alias g='git'
alias gb='git branch -a -v'
alias gs='git status'
alias gd='git diff'

# gc      => git checkout master
# gc bugs => git checkout bugs
function gc {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

alias a='atom'



alias bitcoin="open /Applications/Bitcoin-Qt.app --args -datadir=/Volumes/88MPH/cryptocurrency/Bitcoin"
alias bitcoint="open /Applications/Bitcoin-Qt.app --args -datadir=/Volumes/88MPH/cryptocurrency/Bitcoin -testnet"

alias btcd="bitcoind -datadir=/Volumes/88MPH/cryptocurrency/Bitcoin"
alias btcdt="bitcoind -datadir=/Volumes/88MPH/cryptocurrency/Bitcoin -testnet"



