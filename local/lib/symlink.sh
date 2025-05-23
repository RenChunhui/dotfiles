#!/bin/sh

ln_safe() {
  src=$1
  dst=$2

  # 删除目标（不论是否为链接/文件/目录）
  rm -rf "$dst"

  # 创建符号链接
  ln -s "$src" "$dst"

  log ok "$(printf '%-30s' $(basename $dst)) ${GRAY}[LINKED]${RESET}"
}
