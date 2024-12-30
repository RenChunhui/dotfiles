#!/bin/sh

install_with_gnome() {
  if gnome-extensions list | grep $1 -q -s; then
    log ok "The gnome extension ${BOLD}$1${RESET} is already installed."
  else
    gnome-extensions install $1

    if [ $? -eq 0 ]; then
      log ok "${BOLD}$1${RESET} has been installed successfully."
    else
      log fail "Failed to install $1."
    fi
  fi
}
