#!/bin/sh

if [[ -z "${DOTPATH}" ]]; then
  export DOTPATH=$HOME/.config/dotfiles
fi

if test ! $(which dot); then
  chmod 755 $DOTPATH/bin/dot
fi

dot install all
