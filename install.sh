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
	if [ ! -d "~/.oh-my-zsh" ]
	then
		info 'Installing Oh My Zsh...'
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
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
	PACKAGES=(
		wget
		node
		yarn
		tmux
		neovim
	)

	info 'Installing packages...'
	brew install "${PACKAGES[@]}"
	info 'Cleaning up...'
	
	CASKS=(
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
	
	info 'Installing cask apps...'
	brew cask install "${CASKS[@]}"

	# Remove outdated versions from the cellar
	brew cleanup
}

yarn_package() {
	YARN_PACKAGES=(
		tern
		webpack
	)

	yarn global add "${YARN_PACKAGES[@]}"
}

link_dotfiles() {
	info 'Add tmux、vim、nvim、zsh dotfiles'
	ln -s ~/.dotfiles/.tmux.config ~/.tmux.config
	ln -s ~/.dotfiles/.vimrc ~/.vimrc
	ln -s ~/.dotfiles.vim ~/.vim

	if [ ! -d "~/.config" ]
	then
		mkdir ~/.config
		ln -s ~/.dotfiles/.vim ~/.config/nvim
		ln -s ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
	fi

	ln -s ~/.dotfiles/.zshrc ~/.zshrc
	ln -s ~/.dotfiles/.tern-config ~/.tern-config
}

main() {
	header
	install_zsh
	install_homebrew
	brew_package
	yarn_package
	link_dotfiles
	info 'Installing complete'
}

main
