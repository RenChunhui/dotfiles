#!/bin/sh
#
# 安装配置 NeoVim

source $BIN_PATH/libs/log
source $BIN_PATH/libs/functions

step "安装 NeoVim 环境"

# 安装 lua 环境
if test ! $(which ninja); then
  brew install ninja
fi

if test ! $(which nvim); then
  brew install neovim
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
fi

cat $BIN_PATH/configs/lsp.txt | while read pkg
do
  read_line $pkg
  check_pkg "npm install -g" $pkg
done

if [[ ! -d "$HOME/.config/nvim/lua-language-server" ]]; then
  cd $HOME/.config/nvim
  git clone https://github.com/sumneko/lua-language-server
  cd lua-language-server
  git submodule update --init --recursive
  cd 3rd/luamake
  sh ./compile/install.sh
  cd ../..
  ./3rd/luamake/luamake rebuild
fi
