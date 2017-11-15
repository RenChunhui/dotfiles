#!/bin/bash

###############################################################################
# Functions 																										              #
###############################################################################

# INFO
print_info() {
  printf "\e[0;35m $1\e[0m\n"
}


# SUCCESS
print_success() {
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

# ERROR
print_error() {
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
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




# 安装 XCode 命令行工具
install_xcode_tools() {
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
}

# 安装 Homebrew
install_homebrew() {
	if test ! $(which brew)
	then
		print_info '安装 Homebrew...'

		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
}

# 安装 Homebrew 工具包
install_brew_packages() {
	apps=(
		mas
		wget
		node
		yarn
		tmux
		cmake
		python
		python3
		neovim
	)

	print_info 'Install Homebrew packages...'
	brew install "${apps[@]}"
	brew cleanup

	print_info 'Install Python for neovim...'
	pip2 install neovim --upgrade
	pip3 install neovim --upgrade
}

# Install Apps
install_apps() {
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

	while true; do
		read -p "Install [ Alfred|iTerm2|Chrome|Webstorm|VSCode|QQ|IINA|ShadowsocksX|Sketch|The Unarchiver ]? [y/n] " prompt
		case $prompt in
			[Yy]*)
				brew cask install "${apps[@]}"
				break;;
			[Nn]*)
				break;;
			*)
				print_error 'Please answer yes or no.';;
		esac
	done
}

# Install apps from Apple Store
install_store_apps() {
	apps=(
		836500024		# WeChat
		409201541		# Pages
		409203825		# Numbers
	)

	while true; do
		read -p "Install [ Wechat|Pages|Numbers ] from Apple Store? [y/n]" prompt
		case $prompt in
			[Yy]*)
				mas install "${apps[@]}"
				break;;
			[Nn]*)
				break;;
			*)
				print_error 'Please answer yes or no.';;
		esac
	done
}

# Install global yarn packages
install_yarn_packages() {
	packages=(
		tern
		webpack
		typescript
	)

	while true; do
		read -p "Install Yarn packages [ TernJS|Webpack|Typescript ]? [y/n] " prompt
		case $prompt in
			[Yy]*)
				yarn global add "${packages[@]}"
				break;;
			[Nn]*)
				break;;
			*)

				print_error 'Please answer yes or no.';;
		esac
	done
}

# Install Oh My Zsh
install_zsh() {
	if [[ ! -d $dir/oh-my-zsh ]]; then
		print_info '安装 Oh My Zsh...'

		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	fi
}

# 软链接相关配置文件
symlinks_dotfiles() {
	while true; do
		read -p "Symlinks dotfiles? [y/n]" prompt
		case $prompt in
			[Yy]*)
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

				# Zsh
				ln -fs ~/.dotfiles/.zshrc ~/.zshrc

				# Font
				cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
				break;;
			[Nn]*)
				break;;
			*)
				print_error 'Please answer yes or no.';;
		esac
	done
}

# macOS settings
setup_macos() {
	while true; do
		read -p "macOS settings? [y/n] " prompt
		case $prompt in
			[Yy]*)
				# iterm theme
				open "${HOME}/.dotfiles/iterm/themes/one-dark.itermcolors"

				# Don’t display the annoying prompt when quitting iTerm
				defaults write com.googlecode.iterm2 PromptOnQuit -bool false
				break;;
			[Nn]*)
				break;;
			*)

				print_error 'Please answer yes or no.';;
		esac
	done
}

main() {
	install_xcode_tools
	install_homebrew
	install_brew_packages
	install_apps
	install_store_apps
	install_yarn_packages
	install_zsh
	symlinks_dotfiles
	setup_macos

	print_success 'Complete install!'
}

main

