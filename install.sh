#!/bin/sh

main() {
  if test ! $(which dm); then
    export PATH="$HOME/.config/dotfiles/bin:$PATH"
  fi

  dm install all
}

main "$@"