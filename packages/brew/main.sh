#!/bin/sh

source $BIN_PATH/lib/console

step "安装 Homebrew 环境"

if test ! $(which brew); then
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

  /bin/bash -c "$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
  git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
  git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
fi

brew_version=$(eval brew --version 2>&1 | grep -Eo "([[:digit:]]+\.?){2,3}" | head -1)
ok "Homebrew ${brew_version}"

brew bundle --file=$BIN_PATH/packages/brew/Brewfile --verbose --no-lock
