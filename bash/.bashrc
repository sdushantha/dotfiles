# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####Things I have added#####

# I ♥ my bash prompt
PS1='\[\e[0;31m♥ \e[0;91m\]\W \[\e[0;35m\]❯\[\e[0m\] '

# This allows me to run my own scripts from
export PATH=$PATH":$HOME/bin:$HOME/.local/bin:$HOME/$HOME/$HOME/$HOME/.gem/ruby/2.6.0/bin"

# A better history function. You get to pick from the 
# history using fzf and then grep cleans some things up
# and then eval executes the command. The reason this function
# is called "his" is because if I called it "history", things
# would mess up because the command history is being used in
# function, which means this whole function would just loop itself.
function h(){
    eval '$(history | fzf | grep -Po "\s+\d+\s+\K(.*)")'
}


# Disable ctrl-s and ctrl-q.
stty -ixon 

# Allows you to cd into directory merely by typing the directory name
shopt -s autocd 

# This lets me have a colorful man page :)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# Enable my ~/.aliases file which as all of my aliases
if [ -f ~/.aliases ]; then
. ~/.aliases
fi

export FFF_W3M_XOFFSET=0
export FFF_W3M_YOFFSET=0

set -o vi

# https://goo.gl/KcoQgP
BG_COLOR="#330000"
printf "\\e]11;${BG_COLOR}\\e\\\\"
