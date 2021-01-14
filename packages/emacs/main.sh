#!/bin/sh

source $BIN_PATH/lib/console

step "安装 Emacs 环境"

if test ! $(which emacs); then
  brew install emacs --cask
fi

if [[ ! -d "$HOME/.config/emacs" ]]; then
  git clone https://github.com/RenChunhui/.emacs.d.git $HOME/.config/emacs -b develop
fi
