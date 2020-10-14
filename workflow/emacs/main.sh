if test ! $(which emacs); then
  brew cask install emacs
fi

git clone https://github.com/RenChunhui/.emacs.d.git $HOME/.config/emacs
