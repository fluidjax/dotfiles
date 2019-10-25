



function run() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}


netpid() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}



# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#completion

ZSH_THEME="powerlevel9k/powerlevel9k"
autoload -U compinit
compinit

export PATH=$PATH:$HOME/bin:$HOME/scripts:/usr/local/bin:$HOME/gocode/config/bin:.:/Users/chris/gocode/src/code.qredo.net/up/chris:/usr/local/sbin:/Users/chris/.asdf/installs/ruby/2.6.5/bin/ruby
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH
export GOBIN=~/go/bin
export GO111MODULE=on
export GOROOT=/usr/local/Cellar/go/1.13.3/libexec

export ZSH_TMUX_AUTOSTART='true'
export TERM=xterm-256color
export ZSH=$HOME/dotfiles/oh-my-zsh
export EDITOR=vim
export TMUXINATOR_CONFIG=$HOME/dotfiles/tmuxinator

#export LDFLAGS="-L/usr/local/opt/ruby/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

eval "$(rbenv init -)"



#export HISTSIZE=100000
#export HISTTIMEFORMAT="%d %h - %H:%M:%S "
#export HISTSIZE=100000
#export HISTFILESIZE=100000
#export HISTCONTROL=ignoreboth
#export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#export HISTFILE=$HOME/.zsh_history
#export SAVEHIST=99999
#setopt HIST_IGNORE_ALL_DUPS

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share




export KEYTIMEOUT=1

# Path to your oh-my-zsh installation.
plugins=(
 git
 go
 iterm2
 bundler
 colorize
 python
 dotenv
 osx
 colored-man-pages
 zsh-syntax-highlighting
 history-substring-search
 zsh-autosuggestions
)

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_HOST_LOCAL_BACKGROUND="grey27"
POWERLEVEL9K_HOST_LOCAL_FOREGROUND="cyan1"
POWERLEVEL9K_VI_INSERT_MODE_STRING="★ "
POWERLEVEL9K_VI_COMMAND_MODE_STRING="☆ "

#source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
source ~/dotfiles/zsh/aliases
source $ZSH/oh-my-zsh.sh


bindkey -v
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward



#auto start session
#if [ -z "$TMUX" ]; then
#    tmux attach -t chris || tmux new -s chris
#fi

#autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


function mark {
        export $1="`pwd`";
}

