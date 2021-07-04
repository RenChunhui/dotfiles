#!/bin/sh
#
# 安装 Homebrew，安装 Brewfile 工具及软件

source $BIN_PATH/libs/log
source $BIN_PATH/libs/functions



if test ! $(which brew); then
  step "安装 Homebrew 环境"
  # git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install
  # /bin/bash $HOME/brew-install/install.sh

  # rm -rf $HOME/brew-install
  /bin/bash -c "$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit 1

  brew update
  brew doctor
fi

brew_version=$(eval brew --version 2>&1 | grep -Eo "([[:digit:]]+\.?){2,3}" | head -1)
ok "Homebrew ${BOLD}${brew_version}${RESET_BOLD}"

# 安装 brew-tap.txt 文件列表
cat $BIN_PATH/configs/brew-tap.txt | while read pkg
do
  read_line $pkg
  check_pkg "brew tap" $pkg
done

# 安装 brew.txt 文件列表
cat $BIN_PATH/configs/brew.txt | while read pkg
do
  read_line $pkg
  check_pkg "brew install" $pkg
done

# 安装 brew-cask.txt 文件列表
cat $BIN_PATH/configs/brew-cask.txt | while read pkg
do
  read_line $pkg
  check_pkg "brew install --cask" $pkg
done

# 安装 mas.txt 文件列表
cat $BIN_PATH/configs/mas.txt | while read pkg
do
  read_line $pkg
  check_pkg "mas install" $pkg
done
