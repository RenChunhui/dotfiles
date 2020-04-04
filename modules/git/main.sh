#!/bin/sh

source $DOT_PATH/lib/color
source $DOT_PATH/lib/output

git_account() {
  info "Please input github username."
  read -r use_name
  info "Please input github email."
  read -r user_email

  git config --global user.name "$user_name"
  git config --global user.email "$user_email"
}

git_proxy() {
  info "Please input proxy."
  read -r git_proxy

  git config --global http.proxy "$git_proxy"
  git config --global https.proxy "$git_proxy"
}

git_config() {
  ln -sf $DOT_PATH/modules/git/gitignore_global.symlink $HOME/.gitignore_global
  ln -sf $DOT_PATH/modules/git/gitmessage.symlink $HOME/.gitmessage

  git config --global commit.template ~/.gitmessage
  git config --global core.excludesfile ~/.gitignore_global
}

case $1 in
'' | 'h' | 'help')
  cat <<EOF
  Usage: ${CLI} git <command>

  Commands:
  init            All the configuration.
  account         Set up an account.
  proxy           Set up git proxy.
EOF
  ;;
'init')
  git_account
  git_proxy
  git_config
  ;;
'account')
  git_account && exit 0
  ;;
'proxy')
  git_proxy && exit 0
  ;;
*)
  fail "Invalid command: ${RED}$1${RESET}"
  echo "See ${CYAN}dm git help${RESET} for a list of available commands."
  ;;
esac
