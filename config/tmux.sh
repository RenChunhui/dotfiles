#!/bin/sh

if [[ ! -d "$HOME/.tmux" ]]; then
  info "installing tmux plugins"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
rm -rf $HOME/.tmux.conf

ln -s $HOME/.dotfiles/config/tmux/.tmux.conf $HOME/.tmux.conf

tmux source ~/.tmux.conf
