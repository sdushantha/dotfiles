PS1=$'%{\e[0;31m♥%} %{\e[0;91m%}%c %{\e[0;35m%}❯%{\e[0m%} '

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob


zstyle :compinstall filename '/home/siddharth/.zshrc'

autoload -Uz compinit
compinit

# Enable auto suggestions while typing.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# CTRL+Space to complete/accept the sugestion
# But I prefer to go into NORMAL mode and then press
# L to accept/complete the suggestion because it is
# faster.
bindkey '^ ' autosuggest-accept


# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# This allows me to run my own scripts from
export PATH=$PATH":$HOME/bin:$HOME/.local/bin:$HOME/$HOME/$HOME/$HOME/.gem/ruby/2.6.0/bin:/home/siddharth/.cargo/bin"


### VIM mode config
# Summery:
#  Allows you to use press ESC and then use VIM keys to edit
#  the command currently have in the command line.
#  When you are in INSERT mode, the cursor is a beam and in 
#  NORMAL mode, the cursor is a BLOCK. This makes it easer for us
#  to know what mode we are in.

# Activate vim mode.
bindkey -v

# This brings the cursor back to the beam instead of the block cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}

# Remove mode switching delay.
KEYTIMEOUT=5

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

precmd_functions+=(_fix_cursor)


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

# This lets me have a colorful man page :)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# Enable my ~/.aliases file which has all of my aliases
if [ -f ~/.aliases ]; then
. ~/.aliases
fi

# This is here to set my terminal background color
# The script colors.sh uses this part of the bashrc
# https://goo.gl/KcoQgP
BG_COLOR="#0d191b"
printf "\\e]11;${BG_COLOR}\\e\\\\"


export FFF_LS_COLORS=1
export FFF_HIDDEN=1

