# If not running interactively, don't do anything
[ -z "$PS1" ] && return



#java
if java -version 2>&1 >/dev/null | grep -q "No Java runtime present" ; then
 #no java installed
 :
else
 export JAVA_HOME=`/usr/libexec/java_home -v 11.0.1`
fi
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home


export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Users/chris/Library/Python/3.7/bin
export GOPATH=$GOPATH:~/gocode
export GOBIN=~/go/bin

export HOMEBREW_GITHUB_API_TOKEN=f189759c24f13bd8c116fee8d3127a22a99e6df1

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTTIMEFORMAT="%d %h - %H:%M:%S "
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


STARTCOLOUR='\[\033[1;36m\]'
GITCOLOUR='\[\033[1;33;45m\]'
ENDCOLOUR='\[\033[40;0;37m\]'
HOSTNAME_SHORT=`hostname -s`

if [ $HOSTNAME_SHORT = "guava" ]; then 
  STARTCOLOUR='\[\033[1;36m\]'
fi

if [ $HOSTNAME_SHORT = "mango" ]; then
  STARTCOLOUR='\[\033[1;31m\]'
fi

PS1="${USER}@$STARTCOLOUR${HOSTNAME_SHORT}$ENDCOLOUR:$ENDCOLOUR\w$ENDCOLOUR$GITCOLOUR\$(parse_git_branch_and_add_brackets)$ENDCOLOUR>"
TAB=`echo -e "\t"`


#fix history across mutiple sessions
shopt -s histappend
PROMPT_COMMAND="history -a"
HISTSIZE=99999
HISTFILESIZE=99999
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%d %h - %H:%M:%S "


function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function git-track {
  CURRENT_BRANCH=$(parse_git_branch)
  git-config branch.$CURRENT_BRANCH.remote $1
  git-config branch.$CURRENT_BRANCH.merge refs/heads/$CURRENT_BRANCH
}

function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}


if [ -f /opt/local/etc/bash_completion ]; then
        . /opt/local/etc/bash_completion
    fi
. ~/scripts/bashrc


LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

export PATH=.:/opt/local/bin:/opt/local/sbin:/usr/local/bin:~/scripts:$PATH

# Setting PATH for Python 3.6
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
export PATH="$HOME/.cargo/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


