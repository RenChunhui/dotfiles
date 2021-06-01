#!/bin/sh
#
# 安装 Node 环境

source $BIN_PATH/lib/log

step "安装 Node 环境"

if test ! $(which node); then
  brew install node
fi

cat $BIN_PATH/modules/node/packages.txt | xargs -n 1 npm install -g
