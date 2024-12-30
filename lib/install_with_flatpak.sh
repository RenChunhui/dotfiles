#!/bin/sh

install_with_flatpak() {
  if flatpak list --app | grep "\b$1\b" -q -s
  then
    log ok "Flatpak ${BOLD}$1${RESET} is already installed."
  else
    flatpak install $1 -y

    if [ $? -eq 0 ]; then
      echo "$1 has been installed successfully."
    else
      echo "Failed to install $1."
    fi
  fi
}
