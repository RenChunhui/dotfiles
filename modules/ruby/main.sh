#!/bin/sh
#
# 配置 Ruby 环境

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} ruby <command>

  Commands:
  install       Install Ruby packages.
EOF
  ;;
'install')
  sudo gem install bundler
  bundler install --gemfile=$DOT_PATH/modules/ruby/Gemfile
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm ruby help${RESET} for a list of available commands."
  ;;
esac
