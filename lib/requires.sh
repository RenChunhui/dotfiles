#!/bin/sh

source $HOME/.dotfiles/lib/echo.sh

install_brew() {
  brew list $1 > /dev/null
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    info "brew install $1"
    brew install $1 $2
    if [[ $? != 0 ]]; then
      error "failed to install $1! aborting..."
    fi
    ok "$1 is already installed."
  else
    ok "$1 is already installed."
  fi
}

install_cask() {
  brew cask list $1 > /dev/null
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    info "brew cask install $1 $2"
    brew cask install $1
    if [[ $? != 0 ]]; then
      error "failed to install $1! aborting..."
    fi
    ok "$1 is already installed."
  else
    ok "$1 is already installed."
  fi
}

install_npm() {
  yarn global list $1 > /dev/null
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    info "yarn global install $1."
    ok "$1 is already installed."
  else
    ok "$1 is already installed."
  fi
}