#!/bin/sh

# Text styles
BOLD=$'\e[1m'
DIM=$'\e[2m'
UNDERLINED=$'\e[4m'

# Text colors
TEXT_BLACK=$'\e[30m'
TEXT_RED=$'\e[31m'
TEXT_GREEN=$'\e[32m'
TEXT_YELLOW=$'\e[33m'
TEXT_BLUE=$'\e[34m'
TEXT_CYAN=$'\e[36m'
TEXT_GRAY=$'\e[90m'
TEXT_MAGENTA=$'\e[95m'
TEXT_WHITE=$'\e[97m'

# Reset styles
RESET=$'\e[0m'

# Log function with different levels and styles
log() {
  local level="$1"
  local message="$2"

  case $level in
    group)
      echo ""
      echo "${TEXT_MAGENTA}${BOLD}$message${RESET}"
      echo "${TEXT_GRAY}──────────────────────────────────────────────────────────────────────────────${RESET}"
      ;;
    title)
      echo "${BOLD}$message${RESET}"
      ;;
    ok)
      echo "${TEXT_GREEN}  ●${RESET} $message"
      ;;
    warn)
      echo "${TEXT_YELLOW}${BOLD}  ● WARNING:${RESET} $message"
      ;;
    fail)
      echo "${TEXT_RED}${BOLD}  ● ERROR:${RESET} $message"
      ;;
    info)
      echo "${TEXT_CYAN}  ● INFO:${RESET} $message"
      ;;
    *)
      echo "${TEXT_WHITE}  $message${RESET}"
      ;;
  esac
}
