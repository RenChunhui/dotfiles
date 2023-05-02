#!/bin/sh
#
# Homebrew

echo "📦 Installing Homebrew for you."

if ! command -v brew >/dev/null 2>&1; then
  if [[ ! -d "$HOME/brew-install" ]]; then
    git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install
  fi

  /bin/bash $HOME/brew-install/install.sh
  rm -rf brew-install
fi

brew bundle --file=$XDG_CONFIG_HOME/dotfiles/Brewfile --no-lock
