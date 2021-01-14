#!/bin/sh
#
# Golang 环境

source $BIN_PATH/lib/console

step "安装 Go 环境"

if test ! $(which go); then
  brew install go
fi

# user china proxy
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

go get golang.org/x/tools/gopls@latest
