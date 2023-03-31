# Allow all files in bin and the subdirs to be in PATH
export PATH=$PATH$( find $HOME/bin/ -type d -printf ":%p" )

# Allows me to run scripts which are installed locally
export PATH=$PATH":$HOME/.local/bin"

# Scripts installed using gem
export PATH=$PATH":$HOME/.gem/ruby/2.6.0/bin"

# Scripts installed using cargo
export PATH=$PATH":$HOME/.cargo/bin"
export PATH=$PATH":$HOME/.local/share/cargo/bin"
export PATH=$PATH":$GOPATH/bin"
export PATH=~/.node_modules/bin:$PATH

source $HOME/.config/aliases
