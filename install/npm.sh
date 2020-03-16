#!/bin/sh
#
# Node packages.

source $HOME/.dotfiles/lib/echo.sh

install_npm() {
  yarn global list $1 > /dev/null
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    info "yarn global install $1."
    ok "$1 is already installed."
  else
    ok "$1 is already installed."
  fi
}

install_npm sass
install_npm typescript
install_npm @angular/cli
install_npm @nestjs/cli
install_npm bash-language-server
install_npm vscode-html-languageserver-bin
install_npm vscode-css-languageserver-bin
install_npm yaml-language-server
