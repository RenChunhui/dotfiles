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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" || exit 1
    if [[ $? == 1 ]]; then
      error "如果在国内,请参照网上使用镜像源教程安装。" && exit 0
    fi
  fi
  brew bundle --file=$DOT_PATH/modules/brew/Brewfile
  ;;
'cleanup')
  brew bundle cleanup --file=$DOT_PATH/modules/brew/Brewfile
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm brew help${RESET} for a list of available commands."
  ;;
esac
