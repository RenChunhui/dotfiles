#!/bin/sh
#
# 安装

source $PWD/lib/echo.sh
source $PWD/lib/prompt.sh
source $PWD/lib/mac_version.sh

cat $PWD/assets/ascii.txt

system_type=$(uname -s)

if [ $system_type != "Darwin" ]; then
  error "仅适应于 macOS 系统。"
  exit;
fi

if [ $CODENAME != "Catalina" ]; then
  warn "此配置需要 macOS Catalina，你的版本部分配置有兼容性问题。"
fi

if [ $CODENAME != "Catalina" ]; then
  warn "此配置需要 macOS Catalina，你的版本部分配置有兼容性问题。"
  read -r -p "${YELLOW}? 你确定要继续吗？ [y|N] ${END}" response
  if [[ $response =~ (n|N) ]]; then
    exit;
  fi
fi

###############################################################################
# Xcode
###############################################################################
if ! xcode-select --print-path &> /dev/null; then
  info "ensuring build/install tools are available"
  xcode-select --install &> /dev/null;
fi

###############################################################################
# Git
###############################################################################

source $PWD/config/git.sh

###############################################################################
# Oh My Zsh
###############################################################################

source $PWD/config/zsh.sh

###############################################################################
# Homebrew
###############################################################################

if test ! $(which brew); then
  ask "请选择镜像源"
  options=("清华大学" "Homebrew 官网")
  select_option "${options[@]}"
  chioice=$?

  if [[ $choice -eq 0 ]]; then
    /usr/bin/ruby $PWD/lib/brew_install.rb
    git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core --depth=1
    git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
    git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    brew update
    brew doctor
    export HOMEBREW_NO_AUTO_UPDATE=true
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew tap homebrew/cask
  fi
fi

###############################################################################
# Install
###############################################################################

brew install mas
brew bundle --file $HOME/.dotfiles/install/Brewfile
source $PWD/install/npm.sh
source $PWD/install/rust.sh


###############################################################################
# Clear
###############################################################################

info "清理系统自带 Emacs、Vim、Nano."
# sudo rm /usr/bin/vim
# sudo rm -rf /usr/share/vim
# sudo rm /usr/bin/emacs
# sudo rm -rf /usr/share/emacs
# sudo rm /usr/bin/nano
# sudo rm -rf /usr/share/nano

###############################################################################
# Fonts
###############################################################################
info "添加 SF Mono."

sudo mount -uw /
sudo cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-*.otf /System/Library/Fonts/ || exit 1



###############################################################################
# Config
###############################################################################

cd $HOME/.dotfiles

source $PWD/config/vim.sh
source $PWD/config/tmux.sh
source $PWD/config/osx.sh

main() {
  ask_for_sudo
}

ask_for_sudo() {
  info "Prompting for sudo password."
  if sudo --validate; then
    # keep alive
    while true; do sudo --non-interactive true; \
                   sleep 10; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo password updated."
  else
    error "Sudo password update failed."
    exit 1
  fi
}

main "$@"
