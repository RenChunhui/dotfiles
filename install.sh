#!/bin/sh

if [[ $0 == 'bash' ]]; then
  echo 'export PATH="$HOME/.config/dotfiles/bin:$PATH"' >> ~/.bashrc
else
  echo 'export PATH="$HOME/.config/dotfiles/bin:$PATH"' >> ~/.zshrc
fi

source ~/.zshrc

dm git init
dm zsh install
dm brew install
dm tmux init
dm vim install
dm node install
dm vscode extensions
dm os defaults
