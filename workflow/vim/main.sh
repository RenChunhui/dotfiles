#!/bin/sh

echo "🕓 ${BOLD}NeoVim installing${RESET}"

if test ! $(which nvim); then
  brew install neovim
  yarn global add neovim
  python3 -m pip install --user --upgrade pynvim
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/renchunhui/vim-config.git $HOME/.config/nvim
fi
