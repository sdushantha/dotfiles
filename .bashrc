# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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




# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# This is the real way to remove a package
alias ipython3="ipython3 --no-banner"

# This allows me to run my own scripts from
export PATH=$PATH":$HOME/scripts:$HOME/.local/bin:$HOME/$HOME/$HOME/$HOME/.gem/ruby/2.6.0/bin"

# I rather type subl than subl3
alias subl=subl3

# av means off in Norwegian and it is much shorter than typing poweroff
alias av=poweroff

# Cool warning when running naything with sudo
alias sudo="python3 ~/scripts/sudoer_lecture.py && sudo"

# Set my editor as VIM
export VISUAL=vim
export EDITOR="$VISUAL"

# A better history function. You get to pick from the 
# history using fzf and then grep cleans some things up
# and then eval executes the command. The reason this function
# is called "his" is because if I called it "history", things
# would mess up because the command history is being used in
# function, which means this whole function would just loop itself.
function his(){
    eval '$(history | fzf | grep -Po "\s+\d+\s+\K(.*)")'
}


# Disable ctrl-s and ctrl-q.
stty -ixon 

# Allows you to cd into directory merely by typing the directory name
shopt -s autocd 

# Run the pywal-web script. I cant be bothered to go into the dir 
# where the script is located and run it from there.
alias pywal-web="python3 /home/siddharth/projects/pywal-web/server.py"

# Since ther is some strange problem with the location of my themes,
# viewnior outputs alot of info which I am not bothered about. So my
# solution is to throw the output into the black hole (a.k.a /dev/null)
alias viewnior="viewnior &> /dev/null"

# Im not a fan of the black bar at the bottom of sxiv
alias sxiv="sxiv -b"

# This lets me have a colorful man page :)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
