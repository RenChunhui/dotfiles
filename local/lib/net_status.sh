#!/bin/sh

net_status() {
  # 检查网络连接状态
  if ping -c 1 baidu.com > /dev/null 2>&1; then
    echo "${GREEN}Ready${RESET}"
  else
    echo "${RED}Offline${RESET}"
  fi
}
