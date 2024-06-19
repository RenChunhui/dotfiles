#!/bin/sh

set -e

source "$(pwd)/lib/chalk.sh"

group "Alacritty"

if [[ ! -d $XDG_CONFIG_HOME/alacritty ]]; then
  cp -R $DOTDIR/etc/alacritty $XDG_CONFIG_HOME/alacritty
fi
ok "Alacritty configuration"

# tmux
if [[ ! -d $XDG_CONFIG_HOME/tmux ]]; then
  cp -R $DOTDIR/etc/tmux $XDG_CONFIG_HOME/tmux
fi
ok "Tmux configuratioin"

if [[ ! -f $HOME/.hushlogin ]]; then
  touch $HOME/.hushlogin
fi
