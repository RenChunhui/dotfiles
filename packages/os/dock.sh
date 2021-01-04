#!/bin/sh
#
# Dock

# Dock 项目图标大小设置
defaults write com.apple.dock tilesize -int 48

# 最小化/最大化窗口效果
defaults write com.apple.dock mineffect -string "scale"

# Dock 打开应用时禁用动画
defaults write com.apple.dock launchanim -bool false

# 不显示最近应用
defaults write com.apple.dock show-recents -bool false

# 重新整理 Dock
if test ! $(which dockutil);then
  brew install dockutil
fi

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/WeChat.app"
dockutil --no-restart --add "/Applications/QQ.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"

killall Dock
