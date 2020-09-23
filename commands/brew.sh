#!/bin/sh
#
# Hombrew 包管理

source $BIN_PATH/lib/console
source $BIN_PATH/lib/inquirer

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" || exit 1
  if [[ $? == 1 ]]; then
    error "Please change mirro" && exit 0
  fi
else
  ok "Hombrew has already installed."
fi

brew bundle --file=$BIN_PATH/config/Brewfile
