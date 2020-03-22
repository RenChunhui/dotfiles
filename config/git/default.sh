#!/bin/sh

source $HOME/.dotfiles/lib/foundation

# gitconfig 不用软链接，避免不小心将私人信息上传
if [[ ! -f "$HOME/.gitconfig" ]]; then
  init
else
  choice "你已有 Git 配置,需要重置吗"
  init
fi

init() {
  info "请输入 GitHub 用户名"
  read -r user_name
  info "请输入 GitHub 邮箱"
  read -r user_email

  git config --global user.name "$user_name"
  git config --global user.email "$user_email"

  choice "设置 GitHub 走代理"

  info "请输入代理"
  read -r git_proxy

  git config --global http.proxy "$git_proxy"
  git config --global https.proxy "$git_proxy"

  ok "Git 模块设置完毕"
}
