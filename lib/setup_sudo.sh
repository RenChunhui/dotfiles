#!/bin/sh

# 初始化 sudo 密码缓存
setup_sudo() {
  # 尝试获取 sudo 缓存
  if sudo -v; then
    # 成功获取 sudo 权限后，后台进程每 60 秒刷新一次 sudo 缓存，防止超时
    (
      while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
      done 2>/dev/null &
    )
  else
    log fail "Failed to acquire sudo privileges. Exiting..."
    exit 1
  fi
}
