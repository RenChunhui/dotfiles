#!/bin/sh

# DOTFILES_HOME 依赖 .zshenv 提供,而本脚本正是用于建立该链接,首次安装时存在循环依赖。
# 被 install.sh source 时 install.sh 已导出 DOTFILES_HOME,此处不会触发;
# 单独执行本脚本时按自身位置推导仓库根目录 (local/libexec/../..)。
export DOTFILES_HOME="${DOTFILES_HOME:-$(CDPATH= cd -- "$(dirname "$0")/../.." && pwd)}"

log group "System required"

# 检测 macOS 系统
if [ $(uname) != "Darwin" ]; then
  log fail "This script is intended to run on macOS only."
  exit 1
fi

# 确保环境变量
rm -rf $HOME/.zshenv
ln -s $DOTFILES_HOME/etc/zsh/zshenv $HOME/.zshenv
source $HOME/.zshenv
log ok "$(printf '%-30s' zshenv) ${GRAY}linked${RESET}"

# Apple Silicon
if [[ $(uname -m) == "arm64" ]]; then
  mkdir -p $ZDOTDIR

  rm -rf  $ZDOTDIR/.zprofile
  ln -s $DOTFILES_HOME/etc/zsh/zprofile $ZDOTDIR/.zprofile

  log ok "$(printf '%-30s' zprofile) ${GRAY}linked${RESET}"
fi

# 确保 Homebrew 已安装
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
fi

log ok --last "$(printf '%-30s' homebrew) ${GRAY}installed${RESET}"

