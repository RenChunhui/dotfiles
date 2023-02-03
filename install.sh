#!/bin/sh

set -e

# 确保使用 zsh
chsh -s /bin/zsh

if [[ ! -f "$HOME/.zshenv" ]]; then
  cp $HOME/.config/dotfiles/etc/zsh/.zshenv $HOME/.config/zsh/.zshenv
fi

source $HOME/.config/zsh/.zshenv

chmod -R u+x $XDG_CONFIG_HOME/dotfiles/bin

if ! command -v dot >/dev/null 2>&1; then
  echo "请重启终端"
  exit 1
fi

dot install
