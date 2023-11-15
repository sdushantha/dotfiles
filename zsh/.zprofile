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
export XDG_STATE_HOME="$HOME/.local/state"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ATOM_HOME="$XDG_DATA_HOME"/atom
export ATOM_HOME="$XDG_DATA_HOME"/atom 
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle 
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE="$HOME/.cache/lesshst"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export W3M_DIR="$XDG_DATA_HOME/w3m"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# This lets me have a colorful man page :)
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# Other
#export SUDO_ASKPASS=~/bin/utils/rofi-askpass
export FZF_DEFAULT_COMMAND='ag --hidden -g "" --ignore ".git" --ignore .npm --ignore .node_modules --ignore "*Trash*" --ignore ".java" --ignore "undo" --ignore .cpan'
export FZF_DEFAULT_OPTS="--bind='alt-j:down,alt-k:up' --no-info --reverse"

# https://github.com/pypa/pip/issues/8090#issuecomment-803363268
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

# Pinch to zoom for Firefox
export MOZ_USE_XINPUT2=1

# https://github.com/open-mpi/hwloc/issues/354                                                                                                                                                              
export HWLOC_HIDE_ERRORS=2 
# https://github.com/openwall/john/issues/4765   
export OMPI_MCA_opal_warn_on_missing_libcuda=0

# Path to Windows Home Dir
export WH="/mnt/c/Users/Siddharth.Dushantha"
export WD="$WH/Downloads"
