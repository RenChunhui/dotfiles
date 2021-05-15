#!/bin/sh
#
# 安装 Node 环境

source $BIN_PATH/lib/log

step "安装 Node 环境"

if test ! $(which yarn); then
  brew install yarn
fi

cat $BIN_PATH/packages/node/packages.txt | xargs -n 1 yarn global add