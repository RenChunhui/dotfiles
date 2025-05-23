#!/bin/sh
#
# 先决条件

log group "Prerequisites"

# 确保环境变量
ln_safe $DOTFILES_HOME/etc/zsh/zshenv $HOME/.zshenv
source $HOME/.zshenv

# 确保 Homebrew 已安装
if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
  if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ln_safe $DOTFILES_HOME/etc/zsh/zprofile $ZDOTDIR/.zprofile
  fi
fi
log ok "$(printf '%-30s' homebrew) ${GRAY}[INSTALLED]${RESET}"
