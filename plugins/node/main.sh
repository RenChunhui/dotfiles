#!/bin/sh

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage ${CLI} node <commands>

  Commands:
  install           Global install packages.
  uninstall         Uninstall global packages.
EOF
  ;;
'install')
  cat $DOT_PATH/plugins/node/Nodefile | xargs -n 1 yarn global add
  ;;
'uninstall')
  cat $DOT_PATH/plugins/node/Nodefile | xargs -n 1 yarn global remove
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm node help${RESET} for a list of available commands."
  ;;
esac
