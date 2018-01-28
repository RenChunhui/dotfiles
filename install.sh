#!/usr/bin/env bash

source scripts/cecho.sh
source scripts/print.sh

# packages install
source packages/setup.sh

ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.vim $HOME/.vim
