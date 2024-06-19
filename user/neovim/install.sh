#!/bin/sh

set -e

source "$(pwd)/lib/chalk.sh"

group "NeoVim"

if ! command -v nvim >/dev/null 2>&1; then
  brew install neovim
  ok "neovim"
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
  ok "neovim repo"
fi

pnpm add -g bash-language-server
pnpm add -g vscode-langservers-extracted
pnpm add -g typescript-language-server
pnpm add -g @tailwindcss/language-server
pnpm add -g @volar/vue-language-server
pnpm add -g yaml-language-server
pnpm add -g pyright
