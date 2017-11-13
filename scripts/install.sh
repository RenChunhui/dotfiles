#!/bin/bash

###############################################################################
# Functions 																										              #
###############################################################################

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

ask() {
  print_question "$1"
  read
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

# Print output in red
print_error() {
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

# Print output in purple
print_info() {
  printf "\e[0;35m $1\e[0m\n"
}

# Print output in yellow
print_question() {
  printf "\e[0;33m  [?] $1\e[0m"
}

# Print output in green
print_success() {
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_result() {
	[ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  [ "$3" == "true" ] && [ $1 -ne 0 ] \
    && exit
}

###############################################################################
# Header 			   																												      #
###############################################################################
print_info '----------------------------------------------------------------------'
print_info '                                                                      '
print_info '                         /)          /)       ,                       '
print_info '                        (/      __  (/                                '
print_info '                     (__/ )_(_(_/ (_/ )_(_(__(_                       '
print_info '                                                                      '
print_info '                                                                      '
print_info ' Author: Ren Chunhui                                                  '
print_info ' repo:   https://github.com/RenChunhui/dotfiles                       '
print_info ' E-mail: renchunhui2008@gmail.com                                     '
print_info '                                                                      '
print_info '----------------------------------------------------------------------'

###############################################################################
# XCode Command Line Tools                                                    #
###############################################################################
if ! xcode-select --print-path &> /dev/null; then
  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  print_result $? 'Install XCode Command Line Tools'

  # Point the `xcode-select` developer directory to the appropriate directory from within `Xcode.app`
  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # Prompt user to agree to the terms of the Xcode license
  sudo xcodebuild -license

  print_result $? 'Agree with the XCode Command Line Tools licence'
fi



###############################################################################
# Oh My Zsh																																		#
###############################################################################
if [ ! -d "~/.oh-my-zsh" ]
then
	print_info 'Installing Oh My Zsh...'

	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Reload Zsh settings
source ~/.zshrc


###############################################################################
# Homebrew																																		#
###############################################################################
if test ! $(which brew)
then
	print_info 'Installing Homebrew...'

	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery

brew update
brew upgrade --all



###############################################################################
# Homebrew packages																														#
###############################################################################
apps=(
	mas
	wget
	node
	yarn
	tmux
	neovim
)

print_info 'Installing brew packages...'

brew install "${apps[@]}"
brew cleanup



###############################################################################
# Homebrew cask packages																											#
###############################################################################
apps=(
	alfred
	iterm2
	google-chrome
	webstorm
	qq
	iina
	visual-studio-code
	shadowsocksx-ng
	sketch
	the-unarchiver
)

print_info 'Installing brew cask packages...'

brew cask install "${apps[@]}"



###############################################################################
# App Store Apps        																											#
###############################################################################
apps=(
	497799835		# Xcode
	836500024		# WeChat
	409201541		# Pages
	409203825		# Numbers
)

print_info "Installing App Store apps..."

mas install "${apps[@]}"


###############################################################################
# Yarn packages																																#
###############################################################################
packages=(
	tern
	webpack
	typescript
)

print_info 'Installing Yarn packages...'

yarn global add "${packages[@]}"



###############################################################################
# Symlinks to link dotfiles																										#
###############################################################################

# Clone my github dotfiles
git clone https://github.com/RenChunhui/dotfiles.git ~/.dotfiles

# Zsh
rm -rf .zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Vim
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim ~/.vim

# Neovim
ln -s ~/.dotfiles/.vim ~/.config/nvim
ln -s ~/.dotfiles/.vimrc ~/.config/nvim/init.vim

# Tmux
ln -s ~/.dotfiles/.tmux.config ~/.tmux.config

# TernJS
ln -s ~/.dotfiles/.tern-config ~/.tern-config



###############################################################################
# macOS defaults                                                              #
###############################################################################

# Join a Wi-Fi Network
networksetup -setairportnetwork en0 chunhui.studio Rch500235
networksetup -setairportnetwork en0 TY_2.4G ty12345678
