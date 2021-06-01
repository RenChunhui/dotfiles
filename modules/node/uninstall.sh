#!/bin/sh
#
# 移除 Node 环境

source $BIN_PATH/lib/log

step "移除 Node 环境"

if test ! $(which node); then
  brew install node
fi

cat $BIN_PATH/modules/node/packages.txt | xargs -n 1 npm uninstall -g

if [[ ! -d "/usr/local/lib/node_modules" ]]; then
  rm -rf /usr/local/lib/node_modules
fi

brew uninstall node
