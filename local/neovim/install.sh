#!/bin/sh
#
# NeoVim

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

cat <<EOF
${CYAN}
┌─────────────────────────────────── NeoVim ──────────────────────────────────┐
│                    Hyperextensible Vim-based text editor                    │
└─────────────────────────────────────────────────────────────────────────────┘
${RESET}
EOF

# 安装 lua 环境
if test ! $(which ninja); then
  brew install ninja
fi

if ! command -v nvim >/dev/null 2>&1; then
  brew install neovim
  echo ${GREEN}✔${RESET} "neovim"
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
fi

pnpm add -g bash-language-server
pnpm add -g vscode-langservers-extracted
pnpm add -g typescript-language-server
pnpm add -g @tailwindcss/language-server
pnpm add -g @volar/vue-language-server
pnpm add -g yaml-language-server

if [[ ! -d "$HOME/.config/nvim/lua-language-server" ]]; then
  cd $HOME/.config/nvim
  git clone https://github.com/sumneko/lua-language-server
  cd lua-language-server
  git submodule update --init --recursive
  cd 3rd/luamake
  sh ./compile/install.sh
  cd ../..
  ./3rd/luamake/luamake rebuild
fi
