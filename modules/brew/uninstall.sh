#!/bin/sh
#
# 卸载 Homebrew 以及 Brewfile 工具及软件

brew bundle cleanup --file=$BIN_PATH/modules/brew/Brewfile --verbose

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"