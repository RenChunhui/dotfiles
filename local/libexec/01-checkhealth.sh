#!/bin/sh

# 检测 macOS 系统
if [ $(uname) != "Darwin" ]; then
  log fail "This script is intended to run on macOS only."
  exit 1
fi

# 确保环境变量
rm -rf $HOME/.zshenv
ln -s $DOTFILES_HOME/etc/zsh/zshenv $HOME/.zshenv
source $HOME/.zshenv

# Apple Silicon
if [[ $(uname -m) == "arm64" ]]; then
  mkdir -p $ZDOTDIR

  rm -rf  $ZDOTDIR/.zprofile
  ln -s $DOTFILES_HOME/etc/zsh/zprofile $ZDOTDIR/.zprofile
fi
