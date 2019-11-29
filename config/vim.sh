#!/bin/sh

# Backup old config if needed.
mv ~/.config/nvim{,.bak}

# Clone this repo.
git clone https://github.com/renchunhui/nvim ~/.config/nvim --depth=1

sudo gem install neovim
yarn global add neovim
