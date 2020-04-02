#!/bin/sh

usage() {
  cat <<EOF
  git help
EOF
}

git_config() {
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

case $! in
'' | 'h' | 'help')

  ;;
'init')
  ;;
'config') git_config
  ;;
'proxy') git_proxy
  ;;
*)
  ;;
esac
