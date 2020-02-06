#!/bin/sh

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    error "Could not install Oh My Zsh" >/dev/stderr
    exit 1
  }
  ok "Oh My Zsh is already installed"
else
  ok "Oh My Zsh is already installed"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  info "installing zsh-autosuggestions plugin"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1
  ok "zsh-autosuggestions is already installed"
else
  ok "zsh-autosuggestions is already installed"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  info "installing zsh-syntax-highlighting plugin"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1
  ok "zsh-syntax-highlighting is already installed"
else
  ok "zsh-syntax-highlighting is already installed"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  info "installing zsh-completions plugin"
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions --depth=1
  ok "zsh-completions is already installed"
else
  ok "zsh-completions is already installed"
fi

rm -rf $HOME/.zshrc

cat <<EOF >$HOME/.zshrc
export ZSH="/Users/chunhui/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  brew
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

source $ZSH/oh-my-zsh.sh
EOF
