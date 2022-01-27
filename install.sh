#!/bin/sh

if [[ -z "${DOTPATH}" ]]; then
  export DOTPATH=$HOME/.config/dotfiles
fi

# 防止无权限
chmod -R u+x $HOME/.config/dotfiles/bin

dot install
