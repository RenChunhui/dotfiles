#!/bin/sh
#
# VSCode 环境安装

if test ! $(which code); then
  brew cask install visual-studio-code
fi

cat $BIN_PATH/workflow/code/code.txt | xargs -n 1 code --install-extension
