#!/bin/sh

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} vscode <command>

  Commands:
EOF
  ;;
'extensions')
  if test ! $(which code); then
    brew cask install visual-studio-code
  fi
  cat $DOT_PATH/plugins/vscode/Codefile | xargs -n 1 code --install-extension
  ;;
*)
  ;;
esac
