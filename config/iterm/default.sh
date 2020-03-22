#!/bin/sh

# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 自定义主题
# /usr/libexec/PlistBuddy -c "Merge '~/.dotfiles/config/iterm2/Dracula.itermcolors' 'New Bookmarks':0" ~/Library/Preferences/com.googlecode.iterm2.plist

# 自定义字体
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' SFMono Nerd Font-Regular 12" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' SFMono Nerd Font-Regular 12" ~/Library/Preferences/com.googlecode.iTerm2.plist