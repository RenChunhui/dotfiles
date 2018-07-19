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
	@$(call message,安装 XCode 工具)
	make xcode-tools
	@$(call message,安装 Homebrew)
	make brew
	@$(call message,安装 Nerd Font)
	make font
	@$(call message,安装 VSCode 插件)
	make vscode
	@$(call message,安装 zsh)
	make zsh
	@$(call message,软链接)
	make symlinks
	@$(call message,克隆 Emacs 配置文件)
	make emacs
	@$(call message,安装全局 node 包)
	make node

# Install XCode command line tools
xcode-tools:
	@if ! xcode-select --print-path &> /dev/null; then xcode-select --install &> /dev/null; fi

# Homebrew
brew:
	@if test ! $$(which brew); then /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	@brew bundle
	@brew cleanup

# Gemfile
gem:
	@sudo gem install bundler
	@bundler install

# 字体安装
font:
	@cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# VSCode plugins
vscode:
	@code --install-extension msjsdiag.debugger-for-chrome
	@code --install-extension EditorConfig.EditorConfig
	@code --install-extension Zignd.html-css-class-completion
	@code --install-extension octref.vetur
	@code --install-extension robertohuertasm.vscode-icons
	@code --install-extension vsmobile.vscode-react-native


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

# 软链接
symlinks:
	@ln -sf ${PWD}/vscode/settings.json ~/Library/Application\ Support/Code/User
	@rm -rf ~/Library/Application\ Support/Code/User/snippets
	@ln -sf ${PWD}/vscode/snippets/ ~/Library/Application\ Support/Code/User
	@rm -rf ~/.tern-config
	@ln -sf ${PWD}/.tern-config ~/.tern-config
	@rm -rf ~/.bash_profile
	@ln -sf ${PWD}/.bash_profile ~/.bash_profile
	@rm -rf ~/.bashrc
	@ln -sf ${PWD}/.bashrc ~/.bashrc
	@rm -rf ~/.macos
	@ln -sf ${PWD}/.macos ~/.macos
	@rm -rf ~/.tmux.conf
	@ln -sf ${PWD}/tmux/.tmux.conf ~/.tmux.conf
	@rm -rf ~/.vimrc
	@ln -sf ${PWD}/.vimrc ~/.vimrc
	@rm -rf ~/.vim
	@ln -sf ${PWD}/vim ~/.vim
	@rm -rf ~/.zshrc
	@ln -sf ${PWD}/.zshrc ~/.zshrc

# emacs
.ONESHELL:
emacs:
	@if [[ ! -d $$dir/.emacs.d ]]; \
	then \
		rm -rf ~/.emacs.d; \
	fi

	@git clone https://github.com/RenChunhui/.emacs.d.git ~/.emacs.d

node:
	@yarn global add webpack
	@yarn global add webpack-cli
	@yarn global add stylelint
	@yarn global add eslint
	@yarn global add tern


.PHONY: xcode-tools font vscode zsh osx emacs node zsh-plugins
