#!/bin/sh
#
# 安装 VSCode 环境

if test ! $(which code); then
  brew cask install visual-studio-code
fi

cat $BIN_PATH/config/code.txt | xargs -n 1 code --install-extension
