#!/bin/sh
#
# lsp 相关安装

if test ! $(which yarn); then
  brew install yarn
fi

cat $BIN_PATH/workflow/lsp/lsp.txt | xargs -n 1 yarn global add
