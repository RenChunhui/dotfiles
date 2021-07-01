#!/bin/sh
#
# 安装 Golang 环境

source $BIN_PATH/libs/log

step "安装 Go 环境"

if test ! $(which go); then
  brew install go
fi

# user china proxy
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

go get golang.org/x/tools/gopls@latest
