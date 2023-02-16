#!/bin/sh

set -e

sudo --validate || true

while true; do sleep 60; sudo --non-interactive true; kill -0 "$$" || exit; done 2> /dev/null &

if [[ ! -f "$HOME/.zshenv" ]]; then
  cp $HOME/.config/dotfiles/etc/zsh/.zshenv $HOME/.zshenv
fi

source $HOME/.zshenv

chmod -R u+x $XDG_CONFIG_HOME/dotfiles/bin

if ! command -v dot >/dev/null 2>&1; then
  echo "请重启终端"
  exit 1
fi

dot install
