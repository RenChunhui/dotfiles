#!/bin/sh
#
# zsh 环境

source $BIN_PATH/lib/console
source $BIN_PATH/lib/inquirer

rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.zshrc

# 下载 oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  info "Installing Oh My Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh --depth=1 || exit 1
  if [[ $? == 1 ]]; then
    error "GitHub clone faild,program interruption."
  fi
else
  ok "Oh My Zsh successfully installed."
fi

# 安装插件
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  info "Installing zsh-autosuggestions."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1
else
  ok "zsh-autosuggestions successfully installed."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  info "Installing zsh-syntax-highlighting."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1
else
  ok "zsh-syntax-highlighting successfully installed."
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  info "Installing zsh-completions."
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions --depth=1
else
  ok "zsh-completions successfully installed."
fi

cp $BIN_PATH/config/zshrc $HOME/.zshrc
source $HOME/.zshrc

