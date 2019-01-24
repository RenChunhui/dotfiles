#
# Copyright (c) 2018 Chunhui Ren
#

# dotfiles 配置路径
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

define message
	@printf "\e[0;35m  $1\e[0m\n"
endef

define success
	@printf "\e[0;32m  [✔] $1\e[0m\n"
endef

define error
	@printf "\e[0;31m  [✖] $1 $2\e[0m\n"
endef

all: sudo xcode font packages link emacs macos

sudo:
	sudo -v
	@while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode:
	@if ! xcode-select --print-path &> /dev/null; then xcode-select --install &> /dev/null; fi

clear:
	@$(call message,清除系统自带 vim & Emacs)
	@sudo rm /usr/bin/vim
	@sudo rm -rf /usr/share/vim
	@sudo rm /usr/bin/emacs
	@sudo rm -rf /usr/share/emacs

# 字体安装
font:
	@cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# 工具软件包安装
packages:
	@make brew-packages
	@make node-packages
	@make vscode-packages

# brew
brew:
	@$(call message, 安装软件及工具)
	@if test ! $$(which brew); then /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi

brew-packages: brew
	@brew bundle --file=$(DOTFILES_DIR)/install/Brewfile
	@brew cleanup

# npm
npm:
	@if test ! $$(which yarn); then brew install yarn; fi

node-packages: npm
	@yarn global add $(shell cat install/npmfile)

# vscode
vscode:
	@if test ! $$(which code); then brew cask install visual-studio-code; fi

vscode-packages: vscode
	@for extension in $$(cat install/Codefile); do code --install-extension $$extension; done

# 软链接
link:
	@ln -sf ~/.dotfiles/config/tern/.tern-config ~/.tern-config
	@ln -sf ~/.dotfiles/config/tmux/.tmux.conf ~/.tmux.conf

	@if [[ ! -d ~/.config/nvim ]]; \
	then \
		rm -rf ~/.config/nvim; \
	fi

	@ln -sf ~/.dotfiles/config/nvim ~/.config/nvim

# Emacs
emacs:
	@if [[ ! -d $$dir/.emacs.d ]]; \
	then \
		rm -rf ~/.emacs.d; \
	fi

	@git clone https://github.com/RenChunhui/.emacs.d.git ~/.emacs.d

# macos 设置
macos:
	@if test ! $$(which dockutil); then brew install dockutil; fi
	@chmod +x bin/macos
	@./bin/macos

.PHONY: sudo clear macos
