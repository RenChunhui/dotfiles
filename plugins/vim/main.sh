#!/bin/sh

vim_init() {
  rm -rf $HOME/.config/nvim
  yarn global add neovim
  python3 -m pip install --user --upgrade pynvim
  git clone https://github.com/renchunhui/vim-config.git $HOME/.config/nvim
}

case $1 in
'' | 'h' | 'help')
  ;;
'init')
  ;;
'upgrade')
  ;;
'clean')
  ;;
*)
  ;;
esac
