#!/bin/sh
#
# Uninstall NeoVim

rm -rf $HOME/.config/nvim

pnpm remove --global bash-language-server
pnpm remove --global vscode-langservers-extracted
pnpm remove --global typescript-language-server
pnpm remove --global @tailwindcss/language-server
pnpm remove --global @volar/vue-language-server
pnpm remove --global yaml-language-server

brew uninstall neovim
