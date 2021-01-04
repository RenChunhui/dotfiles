#!/bin/sh

source $BIN_PATH/lib/console

step "安装 NeoVim 环境"

if test ! $(which pip); then
  sudo easy_install pip
fi

if test ! $(which nvim); then
  brew install neovim
  yarn global add neovim
  python3 -m pip install --user --upgrade pynvim
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
fi
