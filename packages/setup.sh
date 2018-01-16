#!/usr/bin/env bash

# 检查是否安装过 Homebrew
if test ! $(which brew)
then
  msg "安装 Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

COMMENT=\#*

# 安装文件夹内列表工具及 Apps
find * -name "*.list" | while read fn; do
  path=${fn%.*}
  cmd=${path#*/}
  set -- $cmd

  msg "准备安装 $1 包..."

  while read package; do
    if [[ $package == $COMMENT ]];
    then continue
    fi

    msg "安装 $package ..."

    if [[ $cmd == code* ]]; then
      $cmd $package
    else
      $cmd install $package
    fi
  done < "$fn"

  success "完成安装 $1 包."
done
