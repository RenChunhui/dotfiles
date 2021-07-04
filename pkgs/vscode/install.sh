#!/bin/sh
#
# Visual Studio Code 环境安装

source $BIN_PATH/libs/log
source $BIN_PATH/libs/functions

step "安装 VSCode 环境"

if test ! $(which code); then
  brew install visual-studio-code --cask
fi

# 安装 code-extensions.txt 文件列表
cat $BIN_PATH/configs/code-extensions.txt | while read pkg
do
  read_line $pkg
  check_pkg "code --install-extension" $pkg
done
