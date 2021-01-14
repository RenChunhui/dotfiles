#!/bin/sh

source $BIN_PATH/lib/console

step "安装 vim 环境"

if [[ ! -d "$HOME/.vim" ]]; then
  git clone https://github.com/RenChunhui/vim.git $HOME/.vim -b develop
fi
