#!/bin/sh
#
# zsh 安装

source $BIN_PATH/lib/console

step "安装 zsh 环境"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "安装 Oh My Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh --depth=1 || exit 1
  if [[ $? == 1 ]]; then
    git clone https://ghproxy.com/https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh --depth=1 || exit 1
  fi
else
  ok "Oh My Zsh 安装成功."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  info "安装 zsh-autosuggestions."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1
else
  ok "zsh-autosuggestions 安装成功."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  info "安装 zsh-syntax-highlighting."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1
else
  ok "zsh-syntax-highlighting 安装成功."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  info "安装 zsh-completions."
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions --depth=1
else
  ok "zsh-completions 安装成功."
fi

rm -rf $HOME/.zshrc

cp $BIN_PATH/packages/zsh/zshrc $HOME/.zshrc
source $HOME/.zshrc
