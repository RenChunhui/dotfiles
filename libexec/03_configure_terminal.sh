#!/bin/sh

# 默认 Shell
default_shell() {
  current_shell=$(basename "$SHELL")

  if [[ $current_shell != "zsh" ]]; then
    log info "Switching to zsh is required."

    # 检查 zsh 是否已安装
    if command -v zsh > /dev/null; then
      log ok "zsh is already installed."
    else
      log info "zsh is not installed. Installing zsh..."
      sudo dnf install -y zsh
      exit 1
    fi

    # 修改用户的 shell
    log info "Changing default shell to zsh..."
    chsh -s "$(which zsh)"

    log warn "To apply the changes:"
    log warn "1. Please log out and log back in, OR"
    log warn "2. Close this terminal and open a new one to start using zsh."

    exit 1
  else
    log ok "You are already using zsh."
  fi
}

# 配置 zsh
setup_zsh() {
  log title "Setup zsh"

  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh || exit 1

    if [[ $? == 1 ]]; then
      log fail "Oh My Zsh"
    else
      log ok "Oh My Zsh"
    fi
  else
    log ok "Oh My Zsh"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1 || exit 1

    if [[ $? == 1 ]]; then
      log fail "zsh-autosuggestions"
    else
      log ok "zsh-autosuggestions"
    fi
  else
    log ok "zsh-autosuggestions"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1 || exit 1

    if [[ $? == 1 ]]; then
      log fail "zsh-syntax-highlighting"
    else
      log ok "zsh-syntax-highlighting"
    fi
  else
    log ok "zsh-syntax-highlighting"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
    git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions --depth=1 || exit 1

    if [[ $? == 1 ]]; then
      log fail "zsh-completions"
    else
      log ok "zsh-completions"
    fi
  else
    log ok "zsh-completions"
  fi

  rm -rf $HOME/.zshrc

  if [[ $(uname -m) == "arm64" ]]; then
    cp $HOME/.config/dotfiles/etc/zsh/zprofile $XDG_CONFIG_HOME/zsh/.zprofile
    log ok "zprofile"
  fi

  if [[ ! -f "$HOME/.zshenv" ]]; then
    cp $HOME/.config/dotfiles/etc/zsh/zshenv $HOME/.zshenv
  fi
  source $HOME/.zshenv

  log ok "Symlink zshenv"

  # cp $HOME/.config/dotfiles/etc/zsh/zshrc $HOME/.zshrc
  # zsh $HOME/.zshrc
  if is_mac; then
    cp $XDG_CONFIG_HOME/dotfiles/etc/zsh/zshrc $ZDOTDIR/.zshrc
    zsh $ZDOTDIR/.zshrc
  else
    cp $XDG_CONFIG_HOME/dotfiles/etc/zsh/zshrc $HOME/.zshrc
    zsh $HOME/.zshrc
  fi

  log ok "zshrc"
}

# 配置 neovim
setup_neovim() {
  log title "Setup NeoVim"

  if [[ ! -d "$HOME/.config/nvim" ]]; then
    git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
    log ok "neovim repo"
  fi
}

configure_terminal() {
  if is_fedora; then
    default_shell
  fi
  setup_zsh
  setup_neovim
}
