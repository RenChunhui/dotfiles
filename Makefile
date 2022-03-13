SHELL := /bin/sh

all:
	@if [[ ! -f "${HOME}/.zshenv" ]]; 									\
	then																\
		cp ${HOME}/.config/dotfiles/configs/zsh/zshenv ${HOME}/.zshenv;	\
	fi

	@chmod -R u+x ${HOME}/.config/dotfiles/bin
	@dot install
	@sudo -v
	@while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
.PHONY: all
