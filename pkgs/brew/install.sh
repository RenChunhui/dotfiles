#!/bin/sh
#
# 安装 Homebrew，安装 Brewfile 工具及软件

set -e

source $BIN_PATH/libs/log
source $BIN_PATH/libs/functions

step "安装 Homebrew 环境"

if test ! $(which brew); then
  # git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install
  # /bin/bash $HOME/brew-install/install.sh

  # rm -rf $HOME/brew-install
  /bin/bash -c "$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew update
  brew doctor
fi

brew_version=$(eval brew --version 2>&1 | grep -Eo "([[:digit:]]+\.?){2,3}" | head -1)
ok "Homebrew ${BOLD}${brew_version}${RESET_BOLD}"

install_brew_tap() {
  info "安装 $1"
  # brew tap $1 > /dev/null

  # if [[ ${PIPESTATUS[0]} != 0 ]]; then
  #   info "安装 $1"
  #   brew tap $1 $2
  # else
  #   ok "$1 已安装"
  # fi
}

install_brew() {
  info "安装 $1"
}

# cat $BIN_PATH/configs/brew-tap.txt | xargs -n 1 brew tap
# cat $BIN_PATH/configs/brew-cask.txt | xargs -n 1 brew install --cask
# cat $BIN_PATH/configs/mas.txt | xargs -n 1 mas install

cat $BIN_PATH/configs/brew.txt | while read pkg
do
  read_line $pkg
  brew list $pkg > /dev/null

  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    brew install $pkg

    if [[ $? != 0 ]]; then
      fail "$pkg 安装失败"
    fi
  else
    ok "$pkg 已安装"
  fi
done

