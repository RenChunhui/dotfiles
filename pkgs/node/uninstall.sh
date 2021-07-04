#!/bin/sh

cat $BIN_PATH/configs/node.txt | xargs -n 1 npm uninstall -g
