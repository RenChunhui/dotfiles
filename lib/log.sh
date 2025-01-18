#!/bin/sh

log_group() {
  echo ""
  echo "${MAGENTA}${BOLD}$1${RESET}"
  echo "${GRAY}──────────────────────────────────────────────────────────────────────────────${RESET}"
}

log_title() {
   echo "${BOLD}$1${RESET}"
}

log_ok() {
  echo "${GREEN}  ●${RESET} $1"
}

log_warn() {
  echo "${YELLOW}  ● WARNING:${RESET} $1"
}

log_fail() {
  echo "${RED}${BOLD}  ● ERROR:${RESET} $1"
}

log_info() {
  echo "${CYAN}  ● INFO:${RESET} $1"
}
