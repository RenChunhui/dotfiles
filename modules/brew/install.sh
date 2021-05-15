#!/bin/sh
#
# 安装 Homebrew，安装 Brewfile 工具及软件

set -e

source $BIN_PATH/lib/log

step "安装 Homebrew 环境"

if test ! $(which brew); then
    git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install
    /bin/bash $HOME/brew-install/install.sh

    rm -rf $HOME/brew-install

    brew update
    brew doctor
fi

brew_version=$(eval brew --version 2>&1 | grep -Eo "([[:digit:]]+\.?){2,3}" | head -1)
ok "Homebrew ${BOLD}${brew_version}${RESET_BOLD}"

step "使用 Homebrew 安装软件及常用工具"
brew bundle --file=$BIN_PATH/modules/brew/Brewfile --verbose --no-lock