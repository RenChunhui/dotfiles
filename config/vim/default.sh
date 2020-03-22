#!/bin/sh

yarn global add neovim
python3 -m pip install --user --upgrade pynvim

git clone https://github.com/renchunhui/vim-config.git $HOME/.config/nvim