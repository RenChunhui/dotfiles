#!/bin/sh

turn_up(){
  osascript -e 'tell application "System Events"' -e 'key code 144' -e ' end tell'
}

turn_down(){
  osascript -e 'tell application "System Events"' -e 'key code 145' -e ' end tell'
}

case $1 in
'' | 'h' | 'help')
  ;;
'restore')
  ;;
*)
  ;;
esac
