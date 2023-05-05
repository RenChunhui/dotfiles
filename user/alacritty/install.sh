#!/bin/sh

echo "📦 Installing Alacritty for you."

if [[ ! -d $XDG_CONFIG_HOME/alacritty ]]; then
  cp -R $DOTDIR/etc/alacritty $XDG_CONFIG_HOME/alacritty
fi

# tmux
if [[ ! -d $XDG_CONFIG_HOME/tmux ]]; then
  cp -R $DOTDIR/etc/tmux $XDG_CONFIG_HOME/tmux
fi

if [[ ! -f $HOME/.hushlogin ]]; then
  touch $HOME/.hushlogin
fi
