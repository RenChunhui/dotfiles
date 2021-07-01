#!/bin/sh
#
# 移除 zsh 环境

source $BIN_PATH/lib/log

warn "移除 zsh 环境"

rm -rf $HOME/.oh-my-zsh
