#!/bin/sh

source $HOME/.dotfiles/lib/echo.sh

install_brew() {
  info "brew $1"
  brew list $1 > /dev/null
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
      info "brew install $1"
      brew install $1 $2
      if [[ $? != 0 ]]; then
          error "failed to install $1! aborting..."
      fi
  fi
  ok
}

install_cask() {
  info "brew cask $1"
  brew cask list $1 > /dev/null
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
      info "brew cask install $1 $2"
      brew cask install $1
      if [[ $? != 0 ]]; then
          error "failed to install $1! aborting..."
      fi
  fi
  ok
}
