#!/bin/sh
#
# NodeJS

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "\n"
echo "${CYAN}#--------------------------------------------------------------------"
echo "# NodeJS"
echo "#--------------------------------------------------------------------${RESET}\n"

if ! command -v pnpm; then
  brew install pnpm
fi

cp $XDG_CONFIG_HOME/dotfiles/etc/npmrc $HOME/.npmrc
