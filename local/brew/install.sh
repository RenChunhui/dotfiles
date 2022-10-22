#!/bin/sh
#
# Homebrew

set -e

CYAN=$'\e[36m'
RESET=$'\e[0m'

cat <<EOF
${CYAN}
┌───────────────────────────────── Homebrew ──────────────────────────────────┐
│                        The package manager for macOS                        │
└─────────────────────────────────────────────────────────────────────────────┘
${RESET}
EOF

if ! command -v brew >/dev/null 2>&1; then
  echo "  Installing Homebrew for you."

  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

  if [[ ! -d "$HOME/brew-install" ]]; then
    git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install
  fi

  /bin/bash $HOME/brew-install/install.sh
  rm -rf brew-install
fi

brew bundle --file=$DOTPATH/Brewfile --no-lock
