#!/bin/sh
#
# NeoVim

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "📦 Installing NeoVim for you."

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
pnpm add -g pyright
