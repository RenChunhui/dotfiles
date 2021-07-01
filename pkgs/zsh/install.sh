#!/bin/sh
#
# 安装 zsh 环境

set -e

source $BIN_PATH/libs/log

step "安装 zsh 环境"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "安装 Oh My Zsh..."
  git clone $GITHUB_PROXY/https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh || exit 1

  if [[ $? == 1 ]]; then
    fail "安装失败 Oh My Zsh"
  else
    ok "成功安装 Oh My Zsh"
  fi
else
  ok "Oh My Zsh 已安装."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  info "安装 zsh-autosuggestions."
  git clone $GITHUB_PROXY/https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    fail "安装失败 zsh-autosuggestions"
  else
    ok "成功安装 zsh-autosuggestions"
  fi
else
  ok "zsh-autosuggestions 已安装."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  info "安装 zsh-syntax-highlighting."
  git clone $GITHUB_PROXY/https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    fail "安装失败 zsh-syntax-highlighting"
  else
    ok "成功安装 zsh-syntax-highlighting"
  fi
else
  ok "zsh-syntax-highlighting 已安装."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  info "安装 zsh-completions."
  git clone $GITHUB_PROXY/https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    fail "安装失败 zsh-completions"
  else
    ok "成功安装 zsh-completions"
  fi
else
  ok "zsh-completions 已安装."
fi


rm -rf $HOME/.zshrc

cp $BIN_PATH/pkgs/zsh/zshrc.symlink $HOME/.zshrc

source $HOME/.zshrc
