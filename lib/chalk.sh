#!/bin/sh

BOLD=$'\e[1m'
DIM=$'\e[2m'
UNDERLINED=$'\e[4m'

TEXT_BLACK=$'\e[30m'
TEXT_RED=$'\e[31m'
TEXT_GREEN=$'\e[32m'
TEXT_YELLOW=$'\e[33m'
TEXT_BLUE=$'\e[34m'
TEXT_GRAY=$'\e[90m'
TEXT_MAGENTA=$'\e[95m'
TEXT_CYAN=$'\e[36m'
TEXT_WHITE=$'\e[97m'

RESET=$'\e[0m'
RESET_BOLD=$'\e[21m'
RESET_DIM=$'\e[22m'
RESET_UNDERLINED=$'\e[24m'

# 信息
info() {
  echo "- ${TEXT_CYAN}INFO${RESET} $1"
}

# 组
group() {
  echo ""
  echo "${TEXT_GRAY}──────────────────────────────────────────────────────────────────────────────${RESET}"
  echo "${TEXT_MAGENTA}$1${RESET}"
}

# 正确
ok() {
  echo "- ${TEXT_GREEN}OK${RESET} $1"
}

# 错误
fail() {
  echo "- ${TEXT_RED}FAIL${RESET} $1"
}

# 警告
warn() {
  echo "- ${TEXT_YELLOW}WARN${RESET} $1"
}

