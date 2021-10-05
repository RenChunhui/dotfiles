#!/bin/sh
#
# 卸载 Homebrew

cat $DOTPATH/config.json | jq ".mas | .[]" | while read pkg
do
  mas uninstall $pkg
done

brew uninstall mas

cat $DOTPATH/config.json | jq ".cask | .[]" | while read pkg
do
  brew uninstall --cask $pkg
done

cat $DOTPATH/config.json | jq ".brew | .[]" | while read pkg
do
  brew uninstall $pkg
done

cat $DOTPATH/config.json | jq ".tap | .[]" | while read pkg
do
  brew uptap $pkg
done

brew uninstall jq

/bin/bash -c "$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
