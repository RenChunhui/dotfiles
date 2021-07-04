#!/bin/sh
#
# remove iterm2

brew uninstall iterm2 --cask
rm -rf $HOME/.tmux.conf
