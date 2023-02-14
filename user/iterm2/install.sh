#!/bin/sh

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

cp -R $DOTDIR/etc/tmux $XDG_CONFIG_HOME/tmux

if [[ ! -f $HOME/.hushlogin ]]; then
  touch $HOME/.hushlogin
fi

# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 导入主题
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'GitHub Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$DOTDIR/etc/iterm2/GitHub Dark.itermcolors' 'Custom Color Presets':'GitHub Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "GitHub Dark Theme"
