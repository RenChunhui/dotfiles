export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

setopt CHECK_JOBS

# alias vim="nvim"
alias vim='/usr/local/Cellar/vim/8.0.1650_1/bin/vim'
