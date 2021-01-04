#!/bin/sh
#
# node

source $BIN_PATH/lib/console

step "安装 Node 环境"

if test ! $(which yarn); then
  brew install yarn
fi

cat $BIN_PATH/packages/node/node.txt | xargs -n 1 yarn global add
