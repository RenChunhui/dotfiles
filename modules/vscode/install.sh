#!/bin/sh
#
# 安装 Visual Studio Code 开发环境

set -e

source $BIN_PATH/lib/log

step "安装 VSCode 环境"

if test ! $(which code); then
  brew install visual-studio-code --cask
fi

cat $BIN_PATH/packages/code/extensions.txt | xargs -n 1 code --install-extension --verbose

sudo rm -rf $HOME/Library/Application\ Support/Code/User/settings.json
sudo cp $BIN_PATH/modules/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json