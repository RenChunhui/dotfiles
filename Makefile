export PATH := bin:$(PATH)

all:
	@sh lib/banner

git:
	@sh ./config/git/default.sh

zsh:
	@sh ./config/zsh/default.sh

brew:
	@sh ./lib/brew_fetch

action_brew:
	@sh ./lib/packages.sh install_brew

action_cask:
	@sh ./lib/packages.sh install_cask
