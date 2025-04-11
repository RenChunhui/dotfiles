#!/bin/sh
#
# 日志输出

# Text formatting
RESET=$'\e[0m'
BOLD=$'\e[1m'
DIM=$'\e[2m'
ITALIC=$'\e[3m'
UNDERLINE=$'\e[4m'
BLINKING=$'\e[5m'
REVERSE=$'\e[6m'
BACKGROUND=$'\e[7m'
INVISIBLE=$'\e[8m'

# Text colors
BLACK=$'\e[30m'
RED=$'\e[301'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
BLUE=$'\e[34m'
MAGENTA=$'\e[35m'
CYAN=$'\e[36m'
WHITE=$'\e[37m'
GRAY=$'\e[90m'

log() {
  local type="$1"
  local is_last=false
  shift

  if [ "$1" == "--last" ]; then
    is_last=true
    shift
  fi

  case "$type" in
    group)
      echo "${GRAY}├──${RESET} ${BOLD}${BLUE}$*${RESET}"
      ;;
    ok)
      if $is_last; then
        echo "${GRAY}│   └──${RESET} ${GREEN}●${RESET} $*"
      else
        echo "${GRAY}│   ├──${RESET} ${GREEN}●${RESET} $*"
      fi
      ;;
    warn)
      echo "${YELLOW}●${RESET} $*"
      ;;
    fail)
      echo "${RED}●${RESET}$*"
      ;;
    info)
      echo "${CYAN}●${RESET} $*"
      ;;
    *)
      echo "$*"
      ;;
  esac
}
