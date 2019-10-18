#!/usr/bin/env bash
#
# Install

source ./lib/echo.sh
source ./lib/require.sh

sudo -v
while true;
  do sudo -n true;
  sleep 60;
  kill -0 "$$" || exit;
done 2>/dev/null &

cat assets/ascii.txt

###############################################################################
# Xcode
###############################################################################
if ! xcode-select --print-path &> /dev/null; then
  bot "ensuring build/install tools are available"
  xcode-select --install &> /dev/null;
fi

###############################################################################
# Homebrew
###############################################################################
running "checking homebrew..."
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  brew tap homebrew/bundle
  brew tap homebrew/core
  brew tap homebrew/cask
  brew tap homebrew/cask-versions
  # cd "$(brew --repo)"
	# git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
	# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
	# git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
	# brew update
  ok
else
  ok
  bot "Homebrew"
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
# Oh My Zsh
###############################################################################
bot "Installing Oh My Zsh"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    error "Could not install Oh My Zsh" >/dev/stderr
    exit 1
  }
  ok
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel9k" ]]; then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

###############################################################################
# Install packages
###############################################################################
bot "checking brew"
for package in $(cat install/Brewfile)
  do require_brew $package
done

bot "checking brew-cask"
for package in $(cat install/Caskfile)
  do require_cask $package
done

bot "checking mas"
for package in $(cat install/Masfile)
  do require_mas $package
done

running "cleanup homebrew"
brew cleanup --force > /dev/null 2>&1
rm -f -r /Library/Caches/Homebrew/* > /dev/null 2>&1
ok

bot "checking npm packages"
for package in $(cat install/Npmfile)
  do require_yarn $package
done

bot "checking vscode plugins"
if test ! $(which code); then
  brew cask install visual-studio-code;
fi
for package in $(cat install/Codefile)
  do require_code $package
done

###############################################################################
# Clear
###############################################################################
bot "clear system vim & Emacs"
sudo rm/usr/bin/vim
sudo rm -rf /usr/share/vim
sudo rm /usr/bin/Emacs
sudo rm -rf /usr/share/emacs

###############################################################################
# tmux
###############################################################################

# bot "tmux plugins"
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
# git clone https://github.com/tmux-plugins/tmux-online-status ~/.tmux/plugins/tmux-online-status
# git clone https://github.com/tmux-plugins/tmux-battery ~/.tmux/plugins/tmux-battery
# git clone https://github.com/christoomey/vim-tmux-navigator ~/.tmux/plugins/vim-tmux-navigator

###############################################################################
# Symlink
###############################################################################
bot "symlink"
ln -sf ${PWD}/config/vscode/settings.json ~/Library/Application\ Support/Code/User
unlink ~/.tern-config > /dev/null 2>&1
ln -s ${PWD}/config/tern/.tern-config ~/.tern-config
unlink ~/.tmux.conf > /dev/null 2>&1
ln -s ${PWD}/config/tmux/.tmux.conf ~/.tmux.conf
unlink ~/.zshrc > /dev/null 2>&1
ln -s ${PWD}/config/zsh/.zshrc ~/.zshrc
unlink ~/.config/nvim > /dev/null 2>&1
ln -s ${PWD}/config/nvim ~/.config/nvim
unlink ~/.hammerspoon > /dev/null 2>&1
ln -s ${PWD}/config/hammerspoon ~/.hammerspoon

###############################################################################
# Fonts
###############################################################################
bot "Fonts setting..."
cp ${PWD}/fonts/DroidSansMonoNerdFontComplete.otf ~/Library/Fonts/ || exit 1
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-Regular.otf ~/Library/Fonts/ || exit 1

###############################################################################
# System
###############################################################################
running "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'
ok

chmod +x ${PWD}/lib/macos.sh
source ${PWD}/lib/macos.sh
