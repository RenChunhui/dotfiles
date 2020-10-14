#!/bin/sh

if test ! $(which brew); then
  /bin/bash $BIN_PATH/workflow/brew/install.sh
fi

brew bundle --file=$BIN_PATH/workflow/brew/Brewfile
