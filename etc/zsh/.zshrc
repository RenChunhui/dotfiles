# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_DISABLE_COMPFIX=true
# Theme
ZSH_THEME="robbyrussell"

# Enable plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

# fpath=($ZDOTDIR/site-functions $fpath)
# autoload -U $fpath[1]/*(.:t)

source $ZSH/oh-my-zsh.sh
