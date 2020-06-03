
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


g(){
    touch ${1}; goland ${1}
}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#completion

ZSH_THEME="powerlevel9k/powerlevel9k"
autoload -U compinit
compinit

export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:$HOME/bin:$HOME/scripts:/usr/local/bin:$HOME/gocode/config/bin:.:/Users/chris/gocode/src/code.qredo.net/up/chris:/usr/local/sbin:/Users/chris/.asdf/installs/ruby/2.6.5/bin/ruby
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH
export GOBIN=~/go/bin
#export GO111MODULE=on
export GOROOT=/usr/local/Cellar/go/1.14.2_1/libexec

export ZSH_TMUX_AUTOSTART='true'
export TERM=xterm-256color
export ZSH=$HOME/dotfiles/oh-my-zsh
export EDITOR=vim
export TMUXINATOR_CONFIG=$HOME/dotfiles/tmuxinator

#export LDFLAGS="-L/usr/local/opt/ruby/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

eval "$(rbenv init -)"



# export HISTSIZE=100000
# export HISTTIMEFORMAT="%d %h - %H:%M:%S "
# export HISTSIZE=100000
# export HISTFILESIZE=100000
# export HISTCONTROL=ignoreboth
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# export HISTFILE=$HOME/.zsh_history
# export SAVEHIST=99999
# setopt HIST_IGNORE_ALL_DUPS

#START History in SQLLite



# HISTFILE=$HOME/.zsh_history
# HISTSIZE=100000
# SAVEHIST=$HISTSIZE
# setopt hist_ignore_all_dups # remove older duplicate entries from history
# setopt hist_reduce_blanks # remove superfluous blanks from history items
# setopt inc_append_history # save history entries as soon as they are entered
# setopt share_history # share

export KEYTIMEOUT=1

# Path to your oh-my-zsh installation.
plugins=(
   autojump
  # k - color in ls with Git info
  # git //git aliases
  # golang //go alias
  # iterm2 
  # bundler
  # colorize ccat cless
  # python
  # dotenv
  osx
  colored-man-pages
  zsh-syntax-highlighting
  history-substring-search
  zsh-autosuggestions
)

##START:    Fix for slow pasting which zsh-suggestions
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
##END:  Fix for slow pasting which zsh-suggestions

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



export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line



#auto start session
#if [ -z "$TMUX" ]; then
#    tmux attach -t chris || tmux new -s chris
#fi

#autojump
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source /Users/chris/dotfiles/oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook
add-zsh-hook precmd histdb-update-outcome
_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}
ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
#END History in SQLLiteH


function mark {
        export $1="`pwd`";
}

export DISABLE_AUTO_TITLE="true"

export BX_CONFIG=/usr/local/etc/libbitcoin/bx.cfg.TESTNET

#For Qredo SSH from Yubikey
export GPG_TTY="$(tty)"
gpg-connect-agent updatestartuptty /bye
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
source /Users/chris/.asdf/asdf.sh

export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

alias python=/usr/local/bin/python3
alias python3=/usr/local/bin/python3
alias pip3=/usr/local/bin/pip3
alias pip=/usr/local/bin/pip3
