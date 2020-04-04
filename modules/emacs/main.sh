#!/bin/sh

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} emacs <command>

  Commands:
  install       Install Emacs and configuration.
EOF
  ;;
'install')
  brew tap railwaycat/emacsmacport
  brew install emacs-mac
  defaults write org.gnu.Emacs Emacs.ToolBar -string no
  defaults write org.gnu.Emacs Emacs.ScrollBar -string no
  defaults write org.gnu.Emacs Emacs.MenuBar -string no
  git clone https://github.com/RenChunhui/.emacs.d.git ~/.emacs.d --depth=1
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm emacs help${RESET} for a list of available commands."
  ;;
esac
