#!/bin/sh
#
# 安装 zsh 环境

source $DOTPATH/libs/log
source $DOTPATH/libs/functions

rm -rf $HOME/.zshrc

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  git_clone "https://github.com/ohmyzsh/ohmyzsh.git" "$HOME/.oh-my-zsh"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  git_clone "https://github.com/zsh-users/zsh-autosuggestions.git" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  git_clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  git_clone "https://github.com/zsh-users/zsh-completions" "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
fi

cp $DOTPATH/internal/zsh/zshrc.symlink $HOME/.zshrc

source $HOME/.zshrc
