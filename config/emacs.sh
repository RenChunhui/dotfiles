#!/bin/sh

brew tap railwaycat/emacsmacport
brew install emacs-mac

defaults write org.gnu.Emacs Emacs.ToolBar -string no
defaults write org.gnu.Emacs Emacs.ScrollBar -string no
defaults write org.gnu.Emacs Emacs.MenuBar -string no

# Emacs 27
# brew install libxml2 autoconf automake texinfo gnutls pkg-config --debug --verbose
# export LDFLAGS="-L/usr/local/opt/libxml2/lib"
# export CPPFLAGS="-I/usr/local/opt/libxml2/include"
# export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
# git clone https://github.com/emacs-mirror/emacs.git
# cd ./emacs && ./autogen.sh
# ./configure && make && make install

git clone https://github.com/RenChunhui/.emacs.d.git ~/.emacs.d --depth=1
