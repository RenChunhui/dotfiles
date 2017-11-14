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
  print_question "$1 (Y/N) "
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
		python
		python3
		neovim
	)

	print_info '安装 Homebrew 工具包...'
	brew install "${apps[@]}"
	brew cleanup

	print_info '安装 NeoVim 依赖 Python...'
	pip2 install neovim --upgrade
	pip3 install neovim --upgrade
}

# 安装 App
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

	ask_for_confirmation "以下将安装软件: Alfred、iTerm2、Chrome、Webstorm、VSCode、QQ、IINA、ShadowsocksX、Sketch、The Unarchiver,你也可以跳过之后安装..."
  if answer_is_yes; then
		brew cask install "${apps[@]}"
  fi
}

# 安装来自 App Store 软件
install_store_apps() {
	apps=(
		836500024		# WeChat
		409201541		# Pages
		409203825		# Numbers
	)

	ask_for_confirmation "以下从 App Store 安装 WeChat、Pages、Numbers，你也可以跳过之后安装..."
	if answer_is_yes; then
		mas install "${apps[@]}"
	fi
}

# 安装全局 Yarn 包
install_yarn_packages() {
	packages=(
		tern
		webpack
		typescript
	)

	print_info '安装 Yarn 全局包...'

	yarn global add "${packages[@]}"
}

# Oh My Zsh
install_zsh() {
	if [[ ! -d $dir/oh-my-zsh/ ]]; then
		print_info '安装 Oh My Zsh...'

		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	fi
}

# 软链接相关配置文件
symlinks_dotfiles() {
	ask_for_confirmation '软链接配置文件'

	if answer_is_yes; then
		# Clone dotfiles
		git clone https://github.com/RenChunhui/dotfiles.git ~/.dotfiles

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
		rm -rf .zshrc
		ln -s ~/.dotfiles/.zshrc ~/.zshrc
	fi
}

# 配置 Vim & Neovim
setup_vim() {
	ask_for_confirmation '安装Vim/NeoVim插件'

	if answer_is_yes; then
		vim
	fi
}

# 系统设置
setup_macos() {
	ask_for_confirmation 'macOS 系统设置'

	if answer_is_yes; then
		# iterm 主题
		open "${HOME}/.dotfiles/iterm/themes/one-dark.itermcolors"

		# iterm 退出不显示提示
		defaults write com.googlecode.iterm2 PromptOnQuit -bool false
	fi
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
	setup_vim
	setup_macos

	print_success '安装完成!'
}

main

