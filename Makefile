# Install
install:  brew gem font vscode zprezto symlinks osx

# Homebrew
brew:
	@if test ! $$(which brew); then /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	@brew bundle

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


# Oh-my-Zsh
zsh:
	@if [[ ! -d $$dir/oh-my-zsh ]]; then sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; fi

	@git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	@git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# 软链接
symlinks:
	@ln -vsf ${PWD}/vscode/settings.json ~/Library/Application\ Support/Code/User
	@rm -rf ~/Library/Application\ Support/Code/User/snippets
	@ln -vsf ${PWD}/vscode/snippets/ ~/Library/Application\ Support/Code/User
	@ln -vsf ${PWD}/.tern-config ~/.tern-config
	@ln -vsf ${PWD}/.bash_profile ~/.bash_profile
	@ln -vsf ${PWD}/.bashrc ~/.bashrc
	@ln -vsf ${PWD}/.macos ~/.macos
	@ln -vsf ${PWD}/tmux/.tmux.conf ~/.tmux.conf
	@ln -vsf ${PWD}/.vimrc ~/.vimrc
	@ln -vsf ${PWD}/vim ~/.vim
	@ln -vsf ${PWD}/zsh/.zshrc ~/.zshrc

# emacs
emacs:
	@git clone https://github.com/RenChunhui/.emacs.d.git .emacs.d

node:
	yarn global add webpack
	yarn global add webpack-cli
	yarn global add stylelint
	yarn global add eslint


.PHONY: font vscode zsh osx emacs
