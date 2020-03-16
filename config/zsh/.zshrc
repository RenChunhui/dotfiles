# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="robbyrussell"

# Enable plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

source $ZSH/oh-my-zsh.sh

# User proxy
export ALL_PROXY=http://127.0.0.1:1081

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Fixed vim8.2 warning
export LC_ALL=en_US.UTF-8