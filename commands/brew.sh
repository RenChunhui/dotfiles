#!/bin/sh
#
# Hombrew 包管理

source $BIN_PATH/lib/console
source $BIN_PATH/lib/inquirer

if test ! $(which brew); then
  /bin/bash $BIN_PATH/lib/brew_install
else
  ok "Hombrew has already installed."
fi

brew bundle --file=$BIN_PATH/config/Brewfile
