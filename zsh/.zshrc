export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=( zsh-autosuggestions zsh-syntax-highlighting git )

source $ZSH/oh-my-zsh.sh

setopt CHECK_JOBS

alias vim="nvim"
