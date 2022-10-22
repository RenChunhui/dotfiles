#!/bin/sh
#
# 安装 zsh 环境

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo ${CYAN}➜${RESET} "安装 ohmyzsh"
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh || exit 1

  if [[ $? == 1 ]]; then
    echo ${RED}✖${RESET} "Oh My Zsh"
  else
    echo ${GREEN}✔${RESET} "Oh My Zsh"
  fi
else
  echo ${GREEN}✔${RESET} "Oh My Zsh"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  echo ${CYAN}➜${RESET} "安装 zsh-autosuggestions."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    echo ${RED}✖${RESET} "zsh-autosuggestions"
  else
    echo ${GREEN}✔${RESET} "zsh-autosuggestions"
  fi
else
  echo ${GREEN}✔${RESET} "zsh-autosuggestions"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  echo ${CYAN}➜${RESET} "安装 zsh-syntax-highlighting."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    echo ${RED}✖${RESET} "zsh-syntax-highlighting"
  else
    echo ${GREEN}✔${RESET} "zsh-syntax-highlighting"
  fi
else
  echo ${GREEN}✔${RESET} "zsh-syntax-highlighting"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  echo ${CYAN}➜${RESET} "安装 zsh-completions."
  git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    echo ${RED}✖${RESET} "zsh-completions"
  else
    echo ${GREEN}✔${RESET} "zsh-completions"
  fi
else
  echo ${GREEN}✔${RESET} "zsh-completions"
fi


rm -rf $HOME/.zshrc

cp $DOTPATH/etc/zshrc $HOME/.zshrc

if [[ $(uname -m) == "arm64" ]]; then
  cp $DOTPATH/etc/zprofile $HOME/.zprofile
fi

zsh
source ~/.zshrc
