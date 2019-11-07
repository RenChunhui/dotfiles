#!/bin/sh
#
# 安装

source $PWD/lib/echo.sh

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
info "Installing Oh My Zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    error "Could not install Oh My Zsh" >/dev/stderr
    exit 1
  }
  ok
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  info "installing zsh-autosuggestions plugin"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  info "installing zsh-syntax-highlighting plugin"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  info "installing zsh-completions plugin"
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi
ok "Oh My Zsh"

###############################################################################
# Homebrew
###############################################################################
info "checking homebrew..."
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  brew tap homebrew/bundle
  brew tap homebrew/core
  brew tap homebrew/cask
  brew tap homebrew/cask-versions
  ok "Homebrew"
else
  ok "Homebrew"
  read -r -p "run brew update && upgrade? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]]; then
    action "updating homebrew..."
    brew update
    ok "homebrew updated"
    action "upgrading brew packages..."
    brew upgrade
    ok "brews upgraded"
  else
    ok "skipped brew package upgrades."
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

###############################################################################
# Clear
###############################################################################

###############################################################################
# Fonts
###############################################################################
info "Fonts setting..."
sudo mount -uw /
sudo cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-*.otf /System/Library/Fonts/ || exit 1
cd /System/Library/Fonts/ && curl -fLo "DroidSansMono Nerd Font Complete.otf" \
    https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

###############################################################################
# Config
###############################################################################

source $PWD/config/emacs.sh
source $PWD/config/vim.sh
source $PWD/config/osx.sh
