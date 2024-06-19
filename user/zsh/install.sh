#!/bin/sh

set -e

source "$(pwd)/lib/chalk.sh"

group "Oh-My-Zsh"

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh || exit 1

  if [[ $? == 1 ]]; then
    fail "Oh My Zsh"
  else
    ok "Oh My Zsh"
  fi
else
  ok "Oh My Zsh"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    fail "zsh-autosuggestions"
  else
    ok "zsh-autosuggestions"
  fi
else
  ok "zsh-autosuggestions"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    fail "zsh-syntax-highlighting"
  else
    ok "zsh-syntax-highlighting"
  fi
else
  ok "zsh-syntax-highlighting"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions --depth=1 || exit 1

  if [[ $? == 1 ]]; then
    fail "zsh-completions"
  else
    ok "zsh-completions"
  fi
else
  ok "zsh-completions"
fi

rm -rf $HOME/.zshrc

if [[ $(uname -m) == "arm64" ]]; then
  cp $DOTDIR/etc/zsh/zprofile $ZDOTDIR/.zprofile
fi

if [[ ! -f $HOME/.zshenv ]]; then
  cp $HOME/.config/dotfiles/etc/zsh/zshenv.darwin $HOME/.zshenv
  source $HOME/.zshenv
fi

cp $DOTDIR/etc/zsh/zshrc $ZDOTDIR/.zshrc

source $ZDOTDIR/.zshrc
