#!/bin/sh

source $BIN_PATH/lib/console

main() {
  step "安装 Homebrew 环境"
  
  if test ! $(which brew); then
    export HOMEBREW_CORE_GIT_REMOTE=https://mirrors.ustc.edu.cn/homebrew-core.git

    git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install || exit 1
    /bin/bash -c "$(sed 's|^BREW_REPO=.*$|BREW_REPO="https://mirrors.ustc.edu.cn/brew.git"|g' $HOME/brew-install/install.sh)"
    rm -rf $HOME/brew-install
  fi

  brew_version=$(eval brew --version 2>&1 | grep -Eo "([[:digit:]]+\.?){2,3}" | head -1)
  ok "Homebrew ${BOLD}${brew_version}${RESET_BOLD}"

  step "使用 Homebrew 安装软件及常用工具"
  brew bundle --file=$BIN_PATH/packages/brew/Brewfile --verbose --no-lock
}

main "$@"