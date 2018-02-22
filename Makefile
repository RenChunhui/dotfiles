# Install
install: | brew vscode osx font

# Homebrew
brew:
	@if test ! $$(which brew); then /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	@brew bundle

# VSCode
.PHONY: vscode
vscode:
	@code --install-extension formulahendry.auto-close-tag
	@code --install-extension formulahendry.auto-rename-tag
	@code --install-extension msjsdiag.debugger-for-chrome
	@code --install-extension EditorConfig.EditorConfig
	@code --install-extension ecmel.vscode-html-css
	@code --install-extension abusaidm.html-snippets
	@code --install-extension Zignd.html-css-class-completion
	@code --install-extension zhuangtongfa.material-theme
	@code --install-extension christian-kohler.path-intellisense
	@code --install-extension octref.vetur
	@code --install-extension vscodevim.vim
	@code --install-extension robertohuertasm.vscode-icons

# 系统设置
.PHONY: osx
osx:
	@chmod +x ./macos/setup.sh
	@./macos/setup.sh

# 软链接
symlinks:
	@ln -vsf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
	@ln -vsf ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf
	@ln -vsf ${PWD}/vim/.vimrc ${HOME}/.vimrc
	@ln -vsf ${PWD}/vim/.vim ${HOME}/.vim

# 字体安装
.PHONY: font
font:
	cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
