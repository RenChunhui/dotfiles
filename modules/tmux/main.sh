#!/bin/sh
#
# 配置 Tmux 环境

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} tmux <command>

  Commands:
  init        Initialization tmux configuration
EOF
  ;;
'init')
  if [[ ! -d "$HOME/.tmux" ]]; then
    info "installing tmux plugins"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  unlink $HOME/.tmux.conf

  ln -s $DOT_PATH/modules/tmux/tmux.conf.symlink $HOME/.tmux.conf

  tmux source ~/.tmux.conf
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm tmux help${RESET} for a list of available commands."
  ;;
esac
