# Install
install: | brew vscode

# Homebrew
brew:
	if test ! $$(which brew); then /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
	brew bundle

# VSCode
.PHONY: vscode
vscode:
	code --install-extension formulahendry.auto-close-tag
	code --install-extension formulahendry.auto-rename-tag
	code --install-extension msjsdiag.debugger-for-chrome
	code --install-extension EditorConfig.EditorConfig
	code --install-extension ecmel.vscode-html-css
	code --install-extension abusaidm.html-snippets
	code --install-extension Zignd.html-css-class-completion
	code --install-extension zhuangtongfa.material-theme
	code --install-extension christian-kohler.path-intellisense
	code --install-extension octref.vetur
	code --install-extension vscodevim.vim
	code --install-extension robertohuertasm.vscode-icons
