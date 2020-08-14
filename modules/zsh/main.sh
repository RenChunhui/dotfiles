#!/bin/sh
#
# 配置 zsh 环境

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

zsh_install() {
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    info "Installing Oh My Zsh..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh --depth=1 || exit 1
    if [[ $? == 1 ]]; then
      error "GitHub clone faild,program interruption."
    fi
  else
    ok "Oh My Zsh successfully installed."
  fi

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

  rm -rf $HOME/.zshrc
  ln -s $DOT_PATH/modules/zsh/zshrc.symlink ~/.zshrc
  source $HOME/.zshrc

  # Set a proxy for terminal.
  ask "Do you want set proxy for terminal." "Arrow for "
  choice=("YES" "NO")
  radio "${choice[@]}"
  choice=$?

  if [[ $choice -eq 0 ]]; then
    info "Input you terminal proxy."
    read -r proxy
    echo "export http_proxy=$proxy" >> ~/.proxyrc
    echo "export https_proxy=$proxy" >> ~/.proxyrc
  fi
}

zsh_uninstall() {
  rm -rf $HOME/.oh-my-zsh
  unlink $HOME/.zshrc
}

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} zsh <command>

  Commands:
  install         Install zsh
  Uninstall       Uninstall zsh
EOF
  ;;
'install')
  zsh_install && exit 0
  ;;
'uninstall')
  zsh_uninstall && exit 0
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm zsh help${RESET} for a list of available commands."
  ;;
esac
