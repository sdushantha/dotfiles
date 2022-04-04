# Start my graphical interface
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx > $HOME/.cache/startx.log 2>&1
fi 

# Default programs:
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="thunar"

# Clean up the $HOME directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export LESSHISTFILE="$HOME/.cache/lesshst"
export PYTHONHISTFILE="$HOME/.cache/python_history"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export GOPATH="$XDG_DATA_HOME"/go
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export CARGO_HOME="$XDG_DATA_HOME"/cargo 
export ATOM_HOME="$XDG_DATA_HOME"/atom 
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle 

# This lets me have a colorful man page :)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# Other
export SUDO_ASKPASS=~/bin/utils/rofi-askpass
export FZF_DEFAULT_COMMAND='ag --hidden -g "" --ignore .git --ignore .npm --ignore .node_modules --ignore "*Trash*" --ignore ".java" --ignore "undo" --ignore .cpan'

# https://github.com/pypa/pip/issues/8090#issuecomment-803363268
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
