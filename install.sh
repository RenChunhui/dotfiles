#!/usr/bin/env bash

source scripts/cecho.sh
source scripts/print.sh

# packages install
source packages/setup.sh

# symlink
if (!isdirectory(expand("$HOME/.config/nvim")))
  call system(expand("mkdir -p $Home/.config/nvim"))
endif
ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
