#!/bin/sh
#
# 彩色打印输出.

source $PWD/lib/color.sh

# Ask question
ask() {
  echo ${CYAN}？$1${END}
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

