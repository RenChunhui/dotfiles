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



all: sudo base clear packages

sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

base:
	@if ! xcode-select --print-path &> /dev/null; then xcode-select --install &> /dev/null; fi

clear:
	@$(call message,清除系统自带 vim & Emacs)
	@sudo rm /usr/bin/vim
	@sudo rm -rf /usr/share/vim
	@sudo rm /usr/bin/emacs
	@sudo rm -rf /usr/share/emacs

# 工具软件包安装
packages: brew-packages node-packages gem-packages vscode-packages

brew:
	@$(call message, 安装软件及工具)
	@if test ! $$(which brew); then /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi

brew-packages: brew
	@brew bundle --file=$(DOTFILES_DIR)/install/Brewfile
	@brew cleanup

npm: brew
	@if test ! $$(which yarn); then brew install yarn; fi

node-packages: npm
	@yarn global add $(shell cat install/npmfile)

gem-packages:
	@sudo gem install bundler
	@bundler install

vscode: brew
	@if test ! $$(which code); then brew cask install visual-studio-code; fi

vscode-packages: vscode
	@for extension in $$(cat install/Codefile); do code --install-extension $$extension; done

.PHONY: sudo base clear packages brew brew-packages npm node-packages gem-packages vscode vscode-packages
