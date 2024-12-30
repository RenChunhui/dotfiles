#!/bin/sh

install_with_dnf() {
  if rpm -q $1 > /dev/null 2>&1; then
    log ok "${BOLD}$1${RESET} is already installed."
  else
    sudo dnf install $1 -y

    if [ $? -eq 0 ]; then
      echo "${BOLD}$1${RESET} has been installed successfully."
    else
      echo "Failed to install $1."
    fi
  fi
}
