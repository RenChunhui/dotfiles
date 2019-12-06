#!/bin/sh

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
/usr/bin/ruby $PWD/lib/brew_uninstall.rb
rm -rf $HOME/.oh-my-zsh
