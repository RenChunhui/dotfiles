#!/bin/sh
#
# NodeJS

echo "📦 Installing NodeJS for you."

if ! command -v pnpm >/dev/null 2>&1; then
  brew install pnpm
fi

if [[ ! -d $XDG_CONFIG_HOME/npm ]]; then
  cp -R $DOTDIR/etc/npm $XDG_CONFIG_HOME/npm
fi
