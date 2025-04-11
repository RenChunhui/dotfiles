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

echo "Automated Configuration, Preferences and Software Installation for macOS."

log_group "Install using homebrew"
brew_install

log_group "Environment Configuration"
after_install

os_defaults
