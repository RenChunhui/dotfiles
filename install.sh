#!/bin/bash

info () {
  printf "\r\033[00;34m $1 \033[0m\n"
}

success () {
  printf "\r\033[00;32m $1 \033[0m\n"
}

# 指示信息
header() {
	info ' -------------------------------------------------------------------- '
	info '                                                                      '
	info '                         /)          /)       ,                       '
  info '                        (/      __  (/                                '
  info '                     (__/ )_(_(_/ (_/ )_(_(__(_                       '
	info '                                                                      '
	info ' Author: Ren Chunhui                                                  '
	info ' repo:   https://github.com/RenChunhui/dotfiles                       '
	info ' E-mail: renchunhui2008@gmail.com                                     '
	info '                                                                      '
	info ' -------------------------------------------------------------------- '
}

# Oh My Zsh
install_zsh() {
	if [ ! -d "~/.oh-my-zsh"]
	then
		info 'Installing Oh My Zsh...'
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		info 'Down'
	fi
}

# Homebrew
install_homebrew() {
	if test ! $(which brew)
	then
		info 'Installing Homebrew...'
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  	info 'Done'
	fi
}

# Homebrew package
brew_package() {
	packages = (
		wget
		yarn
		neovim
	)

	casks = (
		iterm2
		google-chrome
    google-chrome-canary
		webstorm
		qq
		wechat
	)

	brew install "${packages[@]}"
	brew cask install "${casks[@]}"

	# Remove outdated versions from the cellar
	brew cleanup
}

main() {
	header
	install_zsh
	install_homebrew
	brew_package
}

main
