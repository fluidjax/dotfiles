

ZSH_THEME="powerlevel9k/powerlevel9k"


# If not running interactively, don't do anything
[ -z "$PS1" ] && return
bindkey -v
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

#completion
autoload -U compinit
compinit

export PATH=$HOME/bin:$HOME/scripts:/usr/local/bin:$PATH:$HOME/gocode/config/bin:.:/Users/chris/gocode/src/code.qredo.net/up/chris
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:~/gocode
export GOBIN=~/go/bin


export HOMEBREW_GITHUB_API_TOKEN=86deda1a5bb5acf321a5daac8c8b086cf44c8bbc
export ZSH_TMUX_AUTOSTART='true'
export TERM=xterm-256color
export ZSH=$HOME/dotfiles/oh-my-zsh
export EDITOR=vim


export HISTSIZE=100000
export HISTTIMEFORMAT="%d %h - %H:%M:%S "
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTFILE=~/.zsh_history
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


