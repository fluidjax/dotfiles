



# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#completion

ZSH_THEME="powerlevel9k/powerlevel9k"
autoload -U compinit
compinit

export PATH=$HOME/bin:$HOME/scripts:/usr/local/bin:$PATH:$HOME/gocode/config/bin:.:/Users/chris/gocode/src/code.qredo.net/up/chris
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:~/gocode
export GOBIN=~/go/bin
#export GOROOT=/usr/local/Cellar/go

export ZSH_TMUX_AUTOSTART='true'
export TERM=xterm-256color
export ZSH=$HOME/dotfiles/oh-my-zsh
export EDITOR=vim
export TMUXINATOR_CONFIG=$HOME/dotfiles/tmuxinator

export HISTSIZE=100000
export HISTTIMEFORMAT="%d %h - %H:%M:%S "
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=99999
setopt HIST_IGNORE_ALL_DUPS
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

#auto start session
#if [ -z "$TMUX" ]; then
#    tmux attach -t chris || tmux new -s chris
#fi

#autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

