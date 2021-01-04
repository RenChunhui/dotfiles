#!/bin/sh

source $BIN_PATH/lib/console

step "安装 Emacs 环境"

if test ! $(which emacs); then
  brew cask install emacs
fi

if [[ ! -d "$HOME/.config/emacs" ]]; then
  git clone https://github.com/RenChunhui/.emacs.d.git $HOME/.config/emacs
fi
