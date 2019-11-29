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
  ask "Please select the mirror source"
  options=("清华大学" "Homebrew 官网")
  select_option "${options[@]}"
  chioice=$?

  if [[ $choice -eq 0 ]]; then
    /usr/bin/ruby $PWD/lib/brew_install.rb
    # git clone git://mirrors.ustc.edu.cn/homebrew-core.git/ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core --depth=1
    # git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    # git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
    # brew update
    # brew doctor
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
source $PWD/install/gem.sh
source $PWD/install/mongodb.sh



###############################################################################
# Clear
###############################################################################

###############################################################################
# Fonts
###############################################################################
info "Fonts setting..."

brew tap homebrew/cask-fonts
brew cask install font-meslo-nerd-font
brew cask install font-DroidSansMono-nerd-font



###############################################################################
# Config
###############################################################################

cd ~/.dotfiles
source $PWD/config/emacs.sh
source $PWD/config/vim.sh
source $PWD/config/osx.sh

