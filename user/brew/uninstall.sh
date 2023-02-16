#!/bin/sh
#
# 卸载脚本

if [[ ! -d $HOME/brew-install ]]; then
  git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install
  /bin/bash $HOME/brew-install/uninstall.sh
fi

# read -r -p "Are you sure you want to remove Oh My Zsh? [y/N] " confirmation
# if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
#   echo "Uninstall cancelled"
#   exit
# fi
