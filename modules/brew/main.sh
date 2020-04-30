#!/bin/sh

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: dm brew <command>

  Commands:
  install        Install or upgrade all dependencies in a Brewfile.
  uninstall      Uninstall all packages in a Brewfile.
  cleanup        Uninstall all dependencies not listed in a Brewfile.
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
'uninstall')
  brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --brews | xargs -n 1 brew uninstall
  brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --casks | xargs -n 1 brew cask uninstall
  brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --taps | xargs -n 1 brew untap
  brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --mas | xargs -n 1 mas uninstall
  ;;
'cleanup')
  brew bundle cleanup --file=$DOT_PATH/modules/brew/Brewfile
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm brew help${RESET} for a list of available commands."
  ;;
esac
