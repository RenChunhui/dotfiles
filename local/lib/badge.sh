#!/bin/sh
#
# 模拟像 GitHub Badege 的效果

badge() {
  printf "\033[1;30;47m %s \033[0m\033[1;30;44m %s \033[0m\n" "$1" "$2"
}
