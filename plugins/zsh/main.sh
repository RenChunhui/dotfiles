#!/bin/sh

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

zsh_install() {
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    info "安装 Oh My Zsh..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh --depth=1
    ok "Oh My Zsh 安装成功"
  else
    ok "已安装 Oh My Zsh"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    info "安装 zsh-autosuggestions 插件"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1
    ok "zsh-autosuggestions 安装成功"
  else
    ok "已安装 zsh-autosuggestions"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    info "安装 zsh-syntax-highlighting 插件"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1
    ok "zsh-syntax-highlighting 安装成功"
  else
    ok "已安装 zsh-syntax-highlighting"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
    info "安装 zsh-completions 插件"
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions --depth=1
    ok "zsh-completions 安装成功"
  else
    ok "已安装 zsh-completions"
  fi

  rm -rf $HOME/.zshrc
  ln -sf $ROUTE/plugins/zsh/zshrc.symlink $HOME/.zshrc
  source $HOME/.zshrc
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
'install') zsh_install
  ;;
'uninstall') zsh_uninstall
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm zsh help${RESET} for a list of available commands."
  ;;
esac
