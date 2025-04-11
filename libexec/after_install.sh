#!/bin/sh

setup_zsh() {
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh || exit 1

    if [[ $? == 1 ]]; then
      log_fail "Oh My Zsh"
    else
      log_ok "Oh My Zsh"
    fi
  else
    log_ok "Oh My Zsh"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1 || exit 1

    if [[ $? == 1 ]]; then
      log_fail "zsh-autosuggestions"
    else
      log_ok "zsh-autosuggestions"
    fi
  else
    log_ok "zsh-autosuggestions"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1 || exit 1

    if [[ $? == 1 ]]; then
      log_fail "zsh-syntax-highlighting"
    else
      log_ok "zsh-syntax-highlighting"
    fi
  else
    log_ok "zsh-syntax-highlighting"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
    git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions --depth=1 || exit 1

    if [[ $? == 1 ]]; then
      log_fail "zsh-completions"
    else
      log_ok "zsh-completions"
    fi
  else
    log_ok "zsh-completions"
  fi

  rm -rf $HOME/.zshrc

  if [[ $(uname -m) == "arm64" ]]; then
    mkdir -p $ZDOTDIR
    cp etc/zsh/zprofile $ZDOTDIR/.zprofile
  fi

  if [[ ! -f $HOME/.zshenv ]]; then
    cp etc/zsh/zshenv $HOME/.zshenv
    source $HOME/.zshenv
  fi

  cp etc/zsh/zshrc $ZDOTDIR/.zshrc

  zsh $ZDOTDIR/.zshrc
}

setup_ghostty() {
  if [[ ! -d XDG_CONFIG_HOME/ghostty ]]; then
    cp -R $XDG_CONFIG_HOME/dotfiles/etc/ghostty $XDG_CONFIG_HOME/ghostty
  fi

  log_ok "ghostty"
}

setup_tmux() {
  if [[ ! -d $XDG_CONFIG_HOME/tmux ]]; then
    cp -R $XDG_CONFIG_HOME/dotfiles/etc/tmux $XDG_CONFIG_HOME/tmux
  fi

  log_ok "Tmux"
}

setup_neovim() {
  if [[ ! -d "$HOME/.config/nvim" ]]; then
    git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
  fi

  log_ok "neovim repo"
}

after_install() {
  setup_zsh
  setup_ghostty
  setup_tmux
  setup_neovim
}
