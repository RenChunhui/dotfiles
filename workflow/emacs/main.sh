#!/bin/sh

echo "🕔 ${BOLD}Emacs installing${RESET}"

if test ! $(which emacs); then
  brew cask install emacs
fi

if [[ ! -d "$HOME/.config/emacs" ]]; then
  git clone https://github.com/RenChunhui/.emacs.d.git $HOME/.config/emacs
fi

