#!/bin/sh

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: dm brew <command>

  Commands:
  install        Install or upgrade all dependencies in a Brewfile.
  cleanup        Uninstall all dependencies not listed in a Brewfile.
  check          Check if all dependencies are installed in a Brewfile.
EOF
  ;;
'install')
  if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  brew bundle exec -- bundle install
  brew bundle --file $DOT_PATH/plugins/brew/Brewfile
  ;;
'cleanup')
  brew bundle cleanup --file $DOT_PATH/plugins/brew/Brewfile
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm brew help${RESET} for a list of available commands."
  ;;
esac
