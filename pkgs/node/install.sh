#!/bin/sh
#
# 安装 Node Packages

source $BIN_PATH/libs/log
source $BIN_PATH/libs/functions

cat $BIN_PATH/configs/node.txt | while read pkg
do
  read_line $pkg
  check_pkg "npm install -g" $pkg
done
