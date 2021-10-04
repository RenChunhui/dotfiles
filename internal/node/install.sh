#!/bin/sh
#
# 安装 Node Package

cat $DOTPATH/config.json | jq ".npm | .[]" | while read pkg
do
  check_pkg "npm install --g" $pkg
done
