#!/bin/sh

set -e

source "$(pwd)/lib/chalk.sh"

bootstrap_darwin() {
  export ZDOTDIR=$HOME/.config/zsh

  if [[ ! -d $ZDOTDIR ]]; then
    mkdir $ZDOTDIR
  fi

  if [[ ! -f "$HOME/.zshenv" ]]; then
    cp $HOME/.config/dotfiles/etc/zsh/zshenv.darwin $HOME/.zshenv
  fi
}

bootstrap_linux() {
  if ! command -v zsh >/dev/null 2>&1; then
    sudo pacman -S zsh
    chsh -s $(which zsh)
    exit 1
  fi
}

if [[ "$(uname)" == "Darwin" ]]; then
  echo "Automated Configuration, Preferences and Software Installation for macOS."
  bootstrap_darwin
else
  bootstrap_linux
fi

source $HOME/.zshenv

chmod -R u+x $XDG_CONFIG_HOME/dotfiles/bin

if ! command -v dot >/dev/null 2>&1; then
  echo "请重启终端"
  exit 1
fi

dot install
