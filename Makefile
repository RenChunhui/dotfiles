#
# Copyright (c) 2018 Chunhui Ren
#

define message
	@printf "\e[0;35m  $1\e[0m\n"
endef

define success
	@printf "\e[0;32m  [✔] $1\e[0m\n"
endef

define error
	@printf "\e[0;31m  [✖] $1 $2\e[0m\n"
endef

# Install
install:
	make xcode-tools
	make zsh
	make clear
	make brew
	make gem
	make node
	make font
	make vscode
	make symlinks
	make emacs
	make system

# Install XCode command line tools
xcode-tools:
	@if ! xcode-select --print-path &> /dev/null; then xcode-select --install &> /dev/null; fi

# Oh-my-Zsh
.ONESHELL:
zsh:
	@if [[ ! -d $$dir/.oh-my-zsh ]]; \
	then \
		rm -rf ~/.oh-my-zsh; \
		rm -rf ~/.zshrc; \
	fi

	@sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	make zsh-plugins

zsh-plugins:
	@git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	@git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# 清除系统自带 vim & Emacs
clear:
	@$(call message,清除系统自带 vim & Emacs)
	@sudo rm /usr/bin/vim
	@sudo rm -rf /usr/share/vim
	@sudo rm /usr/bin/emacs
	@sudo rm -rf /usr/share/emacs

# Homebrew
brew:
	@$(call message, 安装软件及工具)
	@if test ! $$(which brew); then /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	@brew bundle
	@brew cleanup

# Gemfile
gem:
	@sudo gem install bundler
	@bundler install

# 字体安装
font:
	@$(call message, 字体安装)
	@cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# VSCode plugins
vscode:
	@$(call message, 安装 VSCode 插件)
	@code --install-extension msjsdiag.debugger-for-chrome
	@code --install-extension EditorConfig.EditorConfig
	@code --install-extension Zignd.html-css-class-completion
	@code --install-extension octref.vetur
	@code --install-extension robertohuertasm.vscode-icons
	@code --install-extension vsmobile.vscode-react-native
	@code --install-extension shinnn.stylelint
	@code --install-extension vscodevim.vim

# 软链接
symlinks:
	@ln -sf ${PWD}/vscode/settings.json ~/Library/Application\ Support/Code/User
	@rm -rf ~/.tern-config
	@ln -sf ${PWD}/.tern-config ~/.tern-config
	@rm -rf ~/.tmux.conf
	@ln -sf ${PWD}/.tmux.conf ~/.tmux.conf
	#@rm -rf ~/.config/nvim
	#@ln -sf ${PWD}/nvim ~/.config/nvim
	@rm -rf ~/.zshrc
	@ln -sf ${PWD}/.zshrc ~/.zshrc

system:
	@chmod +x ${PWD}/macos/setup.sh
	@source ${PWD}/macos/setup.sh

# emacs
.ONESHELL:
emacs:
	@if [[ ! -d $$dir/.emacs.d ]]; \
	then \
		rm -rf ~/.emacs.d; \
	fi

	@git clone https://github.com/RenChunhui/.emacs.d.git ~/.emacs.d

node:
	@$(call message, 安装前端开发工具包)
	@yarn global add webpack
	@yarn global add webpack-cli
	@yarn global add stylelint
	@yarn global add eslint
	@yarn global add tern
	@yarn global add typescript

.PHONY: xcode-tools font vscode zsh osx emacs node zsh-plugins
