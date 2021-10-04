SHELL = /bin/sh

DOTPATH=$$HOME/.config/dotfiles

install:
	@sudo chown -R $$(whoami) $(DOTPATH)
	@export PATH=$(DOTPATH)/bin:$(PATH)
	@dot install all

.PHONY: install
