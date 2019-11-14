#!/bin/sh
brew tap railwaycat/emacsmacport
brew cask install emacs-mac

git clone --depth=1 https://github.com/RenChunhui/.emacs.d.git ~/.emacs.d
