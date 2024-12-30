#!/bin/sh

install_with_pnpm() {
  if pnpm list -g | grep $1 -i -q -s; then
    log ok "Language Server Protocol ${BOLD}$1${RESET} is already installed."
  else
    pnpm add -g $1 -q

    if [ $? -eq 0 ]; then
      echo "${BOLD}$1${RESET} has been installed successfully."
    else
      echo "Failed to install ${BOLD}$1${RESET}."
    fi
  fi
}
