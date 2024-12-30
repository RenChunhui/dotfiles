#!/bin/sh

install_with_code() {
  if code --list-extensions | grep $1 -i -q -s; then
    log ok "The extension ${BOLD}$1${RESET} is already installed."
  else
    code --install-extension $1 --log off
    if [ $? -eq 0 ]; then
      log ok "${BOLD}$1${RESET} has been installed successfully."
    else
      log fail "Failed to install $1."
    fi
  fi
}
