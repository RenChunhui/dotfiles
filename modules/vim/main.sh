#!/bin/sh
#
# 配置 neovim 开发环境

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} vim <command>

  Commands:
  install         Install neovim configuration.
EOF
  ;;
'install')
  if test ! $(which nvim); then
    brew install neovim
  fi

  rm -rf $HOME/.config/nvim
  yarn global add neovim
  python3 -m pip install --user --upgrade pynvim
  git clone https://github.com/renchunhui/vim-config.git $HOME/.config/nvim
  ;;
*)
  ;;
esac
