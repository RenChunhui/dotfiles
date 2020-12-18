#!/bin/sh

echo "🕓 ${BOLD}NeoVim installing${RESET}"

if test ! $(which pip); then
  sudo easy_install pip
fi

if test ! $(which nvim); then
  brew install neovim
  yarn global add neovim
  python3 -m pip install --user --upgrade pynvim
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
fi
