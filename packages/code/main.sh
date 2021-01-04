#!/bin/sh
#
# VSCode 环境安装

source $BIN_PATH/lib/console

step "安装 VSCode 环境"

if test ! $(which code); then
  brew cask install visual-studio-code
fi

cat $BIN_PATH/packages/code/code.txt | xargs -n 1 code --install-extension

rm -rf $HOME/Library/Application\ Support/Code/User/settings.json
sudo ln -s $HOME/.config/dotfiles/packages/code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
