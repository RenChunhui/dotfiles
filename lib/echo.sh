#!/bin/sh
#
# 彩色打印输出.

END=$'\e[0m'
RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
YELLOW=$'\e[33m'

# Ask question
ask() {
  echo ${CYAN}？ $1${END}
}

# Base infomation
info() {
  echo ${CYAN}➜ $1${END}
}

# Success message
ok() {
  echo ${GREEN}✔ $1${END}
}

# Warning message
warn() {
  echo ${YELLOW}⚠ $1${END}
}

# Error message
error() {
  echo ${RED}✖ $1${END}
}

