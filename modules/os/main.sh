#!/bin/sh

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} os <command>

  Commands:
  defaults          Default configuration for self.
  lock              System lock.
  restart           System restart.
  sleep             System sleep.
  shutdown          System shutdown.
EOF
  ;;
'defaults')
  if test ! $(which dockutil); then
    brew install dockutil
  else
    source $DOT_PATH/modules/os/defaults.sh
  fi
  ;;
'lock')
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
  ;;
'restart')
  osascript -e 'tell app "loginwindow" to «event aevtrrst»'
  ;;
'sleep')
  pmset sleepnow
  ;;
'shutdown')
  osascript -e 'tell app "loginwindow" to «event aevtrsdn»'
  ;;
*)
  ;;
esac
