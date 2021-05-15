#!/bin/sh
#
# 安装 NeoVim 环境

source $BIN_PATH/lib/log

step "安装 NeoVim 环境"

if test ! $(which nvim); then
  brew install neovim
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/vim.git $HOME/.config/nvim
fi

pip3 install pynvim
yarn global add neovim