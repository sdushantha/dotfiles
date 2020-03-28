# Default programs:
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="thunar"

# ~/ Clean-up:
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export LESSHISTFILE="$HOME/.cache/lesshst"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export PYTHONSTARTUP="$HOME/.config/python/pythonstartup.py"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
eval $(dircolors "$XDG_CONFIG_HOME"/dircolors)
