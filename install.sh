#!/bin/sh
#
# 安装脚本

set -e

# 引入辅助脚本
for script in $(pwd)/lib/*.sh; do
  . "$script"
done

for script in $(pwd)/libexec/*.sh; do
  . "$script"
done

display_banner
setup_sudo

log group "Step 1: Initial Setup"
initial_setup

log group "Step 2: Installing packages from Bundlefile"
install_pkgs

log group "Step 3: Configure Terminal"
configure_terminal
