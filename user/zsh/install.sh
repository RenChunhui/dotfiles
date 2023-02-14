#!/bin/sh
#
# ZSH

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
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
  echo "安装 zsh-autosuggestions."
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
  echo "安装 zsh-syntax-highlighting."
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
  echo "安装 zsh-completions."
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

if [[ $(uname -m) == "arm64" ]]; then
  cp $DOTDIR/etc/zsh/.zprofile $HOME/.zprofile
fi

if [[ ! -f $HOME/.zshenv ]]; then
  cp $HOME/.config/dotfiles/etc/zsh/.zshenv $HOME/.zshenv
  source $HOME/.zshenv
fi

cp $DOTDIR/etc/zsh/.zshrc $HOME/.zshrc

source $HOME/.zshrc
