# Install
install:  brew gem font vscode zsh symlinks osx

# Homebrew
brew:
	@if test ! $$(which brew); then /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	@brew bundle

#	Gemfile
gem:
	@sudo gem install bundler
	@bundler install

# 字体安装
font:
	@cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# VSCode
vscode:
	@code --install-extension akamud.vscode-theme-onedark
	@code --install-extension golf1052.base16-generator
	@code --install-extension formulahendry.auto-close-tag
	@code --install-extension formulahendry.auto-rename-tag
	@code --install-extension msjsdiag.debugger-for-chrome
	@code --install-extension EditorConfig.EditorConfig
	@code --install-extension ecmel.vscode-html-css
	@code --install-extension abusaidm.html-snippets
	@code --install-extension Zignd.html-css-class-completion
	@code --install-extension christian-kohler.path-intellisense
	@code --install-extension octref.vetur
	@code --install-extension vscodevim.vim
	@code --install-extension robertohuertasm.vscode-icons

# Oh-my-Zsh
zsh:
	@if [[ ! -d $$dir/oh-my-zsh ]]; then sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; fi

	@git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	@git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# 软链接
symlinks:
	@ln -vsf ${PWD}/zsh/.zshrc ~/.zshrc
	@ln -vsf ${PWD}/tmux/.tmux.conf ~/.tmux.conf
	@ln -vsf ${PWD}/nvim ~/.config/nvim
	@ln -vsf ${PWD}/vscode/settings.json ~/Library/Application\ Support/Code/User
	@rm -rf ~/Library/Application\ Support/Code/User/snippets
	@ln -vsf ${PWD}/vscode/snippets/ ~/Library/Application\ Support/Code/User

# 系统设置
osx:
	@chmod +x ./macos/setup.sh
	@./macos/setup.sh

.PHONY: font vscode zsh osx
