#!/bin/sh
#
# 清理

homebrew() {
  brew bundle cleanup --file=$BIN_PATH/config/Brewfile
}
