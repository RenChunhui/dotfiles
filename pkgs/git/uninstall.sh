#!/bin/sh

source $BIN_PATH/libs/log
source $BIN_PATH/libs/functions

cat $BIN_PATH/configs/brew.txt | while read pkg
do
  read_line $pkg
  check_pkg "brew uninstall" $pkg
done
