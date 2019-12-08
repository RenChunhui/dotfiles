#!/bin/sh

brew tap railwaycat/emacsmacport
brew install emacs-mac

git clone https://github.com/RenChunhui/.emacs.d.git ~/.emacs.d --depth=1
