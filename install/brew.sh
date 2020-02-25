#!/bin/sh
#
# Homebrew install tools.

source $HOME/.dotfiles/lib/requires.sh

install_brew mas
install_brew wget
install_brew node
install_brew yarn
install_brew tmux
install_brew neovim
install_brew dockutil
install_brew cloc
install_brew webp
install_brew screenfetch
install_brew mysql@5.7

brew cleanup
