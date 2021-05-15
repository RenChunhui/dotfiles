#!/bin/sh
#
# 安装 Golang 开发环境

source $BIN_PATH/lib/log

step "安装 Go 环境"

if test ! $(which go); then
  brew install go
fi

go get golang.org/x/tools/gopls@latest