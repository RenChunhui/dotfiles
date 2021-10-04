#!/bin/sh
#
# Visual Studio Code 环境安装

if test ! $(which code); then
  brew install visual-studio-code --cask
fi

# mas
cat $DOTPATH/config.json | jq ".code | .[]" | while read pkg
do
  check_pkg "code --install-extension" $pkg
done
