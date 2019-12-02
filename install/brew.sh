#!/bin/sh
#
# Homebrew install tools.

if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

apps=(
  mas
  wget
  node
  yarn
  tmux
  neovim
  aria2
  dockutil
  cloc
  webp
  screenfetch
)

brew install "${apps[@]}"

brew cleanup
