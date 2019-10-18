#!/usr/bin/env bash

RESTORE=$(echo -en '\001\033[0m\002')
RED=$(echo -en '\001\033[00;31m\002')
GREEN=$(echo -en '\001\033[00;32m\002')
YELLOW=$(echo -en '\001\033[00;33m\002')
BLUE=$(echo -en '\001\033[00;34m\002')
MAGENTA=$(echo -en '\001\033[00;35m\002')
PURPLE=$(echo -en '\001\033[00;35m\002')
CYAN=$(echo -en '\001\033[00;36m\002')
LIGHTGRAY=$(echo -en '\001\033[00;37m\002')
LRED=$(echo -en '\001\033[01;31m\002')
LGREEN=$(echo -en '\001\033[01;32m\002')
LYELLOW=$(echo -en '\001\033[01;33m\002')
LBLUE=$(echo -en '\001\033[01;34m\002')
LMAGENTA=$(echo -en '\001\033[01;35m\002')
LPURPLE=$(echo -en '\001\033[01;35m\002')
LCYAN=$(echo -en '\001\033[01;36m\002')
WHITE=$(echo -en '\001\033[01;37m\002')

# 正常
function ok() {
  echo ${GREEN}✔ ${RESTORE}$1
}

# 机器人
function bot() {
  echo ${MAGENTA}★ ${RESTORE}$1
}

# 运行
function running() {
  echo -en ${YELLOW}⟲ ${RESTORE}$1:
}

function action() {
  echo ${CYAN}➤ ${RESTORE}$1...
}

# 警告
function warn() {
  echo ${YELLOW}⚠ ${RESTORE}$1
}

# 错误
function error() {
  echo ${RED}✖ ${RESTORE}$1
}

