#!/bin/sh

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

