#!/bin/sh

source $BIN_PATH/lib/console

if test ! $(which brew); then
  HOMEBREW_CORE_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git /bin/bash $BIN_PATH/workflow/brew/install.sh
  git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
  git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
  git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
fi

brew_version=$(eval brew --version 2>&1 | grep -Eo "([[:digit:]]+\.?){2,3}" | head -1)
ok "Homebrew ${brew_version}"

brew bundle --file=$BIN_PATH/workflow/brew/Brewfile
