#!/bin/sh
#
# Golang

echo "🕕 ${BOLD}installing golang${RESET}"

if test ! $(which go); then
  brew install go
fi

# user china proxy
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

go get golang.org/x/tools/gopls@latest

# go get -u -v github.com/gin-gonic/gin
# go get -u -v gorm.io/gorm
