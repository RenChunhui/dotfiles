#!/bin/sh
#
# 安装 Homebrew 及相关软件工具等

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

# 安装
install() {
  if test ! $(which brew); then
    ask "请选择镜像源"
    mirrors=("Hombrew 官方" "清华大学源" "中科大源" "阿里源")
    select_option "${mirrors[@]}"
    chioice=$?

    if [[ $chioice -eq 0 ]]; then
      export BREW_MIRROR_REPO="https://github.com/Homebrew/brew.git"
    elif [[ $chioice -eq 1 ]]; then
      export BREW_MIRROR_REPO="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
      HOMEBREW_CORE_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git /bin/bash $DOT_PATH/modules/brew/install.sh
      git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core --depth=1
      git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
      git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
      git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
      export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    elif [[ $chioice -eq 2 ]]; then
      export BREW_MIRROR_REPO="https://mirrors.ustc.edu.cn/brew.git"
      HOMEBREW_CORE_GIT_REMOTE=https://mirrors.ustc.edu.cn/homebrew-core.git /bin/bash $DOT_PATH/modules/brew/install.sh
      git clone https://mirrors.ustc.edu.cn/homebrew-core.git/ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core --depth=1
      git clone https://mirrors.ustc.edu.cn/homebrew-cask.git/ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
      git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git/
      git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git/
      export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
    else
      export BREW_MIRROR_REPO="https://mirrors.aliyun.com/homebrew/brew.git"
      HOMEBREW_CORE_GIT_REMOTE=https://mirrors.aliyun.com/homebrew/homebrew-core.git /bin/bash $DOT_PATH/modules/brew/install.sh
      git clone https://mirrors.aliyun.com/homebrew/homebrew-core.git/ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core --depth=1
      git clone https://mirrors.aliyun.com/homebrew/homebrew-cask.git/ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
      git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git/
      git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-cask.git/
      export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
    fi
  fi

  brew bundle --file=$DOT_PATH/modules/brew/Brewfile
}

# 恢复源
restore() {
  git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git
  git -C "$(brew --repo homebrew/core)" remote set-url origin https://github.com/Homebrew/homebrew-core.git
  git -C "$(brew --repo homebrew/cask)" remote set-url origin https://github.com/Homebrew/homebrew-cask.git
}

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: dm brew <command>

  Commands:
  install        Install or upgrade all dependencies in a Brewfile.
  uninstall      Uninstall all packages in a Brewfile.
  cleanup        Uninstall all dependencies not listed in a Brewfile.
EOF
  ;;
'install')
  install
  ;;
'uninstall')
  # brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --brews | xargs -n 1 brew uninstall
  # brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --casks | xargs -n 1 brew cask uninstall
  # brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --taps | xargs -n 1 brew untap
  # brew bundle list --file=$DOT_PATH/modules/brew/Brewfile --mas | xargs -n 1 mas uninstall
  /bin/bash $DOT_PATH/modules/brew/uninstall.sh
  ;;
'cleanup')
  brew bundle cleanup --file=$DOT_PATH/modules/brew/Brewfile
  ;;
'restore')
  restore
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm brew help${RESET} for a list of available commands."
  ;;
esac
