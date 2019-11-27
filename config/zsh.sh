#!/bin/sh

rm -rf $HOME/.zshrc

cat <<EOF >$HOME/.zshrc
export ZSH="/Users/chunhui/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    brew
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

source $ZSH/oh-my-zsh.sh
EOF
