#!/bin/sh
#
# 安装 Homebrew

source $DOTPATH/libs/functions

if test ! $(which brew); then
  while /bin/bash -c "$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; do
    /bin/bash -c "$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  done

  brew update
fi

if test ! $(which jq); then
  brew install jq
fi

# brew tap
cat $DOTPATH/config.json | jq ".tap | .[]" | while read pkg
do
  check_pkg "brew tap" $pkg
done

# brew install
cat $DOTPATH/config.json | jq ".brew | .[]" | while read pkg
do
  check_pkg "brew install --quiet" $pkg
done

# brew install --cask
cat $DOTPATH/config.json | jq ".cask | .[]" | while read pkg
do
  check_pkg "brew install --cask --quiet" $pkg
done

if test ! $(which mas); then
  brew install mas
fi

# mas install
cat $DOTPATH/config.json | jq ".mas | .[]" | while read pkg
do
  check_pkg "mas install" $pkg
done
