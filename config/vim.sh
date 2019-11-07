#!/bin/sh

# Backup old config if needed.
mv ~/.config/nvim{,.bak}

# Clone this repo.
git clone https://github.com/renchunhui/nvim ~/.config/nvim
