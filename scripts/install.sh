#!/bin/sh
#
# 安装

source $PWD/lib/echo.sh
source $PWD/lib/prompt.sh
source $PWD/lib/mac_version.sh

cat $PWD/assets/ascii.txt

###############################################################################
# Xcode
###############################################################################
if ! xcode-select --print-path &> /dev/null; then
  info "ensuring build/install tools are available"
  xcode-select --install &> /dev/null;
fi

###############################################################################
# Oh My Zsh
###############################################################################

source $PWD/config/zsh.sh

###############################################################################
# Homebrew
###############################################################################
info "checking homebrew..."
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
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    brew tap homebrew/core
    brew tap homebrew/cask
    brew tap homebrew/cask-versions
  fi

  ok "Homebrew"
else
  ok "Homebrew"
  read -r -p "run brew update && upgrade? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]]; then
    info "updating homebrew..."
    brew update
    ok "homebrew updated"
    info "upgrading brew packages..."
    brew upgrade
    ok "brews upgraded"
  else
    info "skipped brew package upgrades."
  fi
fi

###############################################################################
# Install
###############################################################################
source $PWD/install/brew.sh
source $PWD/install/brew-cask.sh
source $PWD/install/mas.sh
source $PWD/install/npm.sh



###############################################################################
# Clear
###############################################################################

info "清理系统自带 Emacs、Vim、Nano."
sudo rm /usr/bin/vim
sudo rm -rf /usr/share/vim
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs
sudo rm /usr/bin/nano
sudo rm -rf /usr/share/nano

###############################################################################
# Fonts
###############################################################################
info "添加常用等宽字体."

brew tap homebrew/cask-fonts
brew cask install font-meslo-nerd-font
brew cask install font-DroidSansMono-nerd-font

if [[ $CODENAME -eq "Mojave" ]]; then
  sudo cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-*.otf /Library/Fonts/ || exit 1
else
  sudo mount -uw /
  sudo cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-*.otf /System/Library/Fonts/ || exit 1
fi



###############################################################################
# Config
###############################################################################

cd ~/.dotfiles
source $PWD/config/emacs.sh
source $PWD/config/vim.sh
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
