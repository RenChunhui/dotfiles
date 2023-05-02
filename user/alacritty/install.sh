#!/bin/sh

echo "📦 Installing Alacritty for you."

if [[ ! -d $XDG_CONFIG_HOME/alacritty ]]; then
  cp -R $DOTDIR/etc/alacritty $XDG_CONFIG_HOME/alacritty
fi
