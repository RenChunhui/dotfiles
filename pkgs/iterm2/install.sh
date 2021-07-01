#!/bin/sh
#
# 配置终端环境

cp $BIN_PATH/pkgs/iterm2/hushlogin $HOME/.hushlogin
cp $BIN_PATH/pkgs/iterm2/tmux.conf $HOME/.tmux.conf

# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 自定义字体
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' SFMonoNerdFontComplete-Regular 13" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' SFMonoNerdFontComplete-Regular 13" ~/Library/Preferences/com.googlecode.iTerm2.plist

# 导入主题

/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'DoomOne' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/pkgs/iterm/themes/DoomOne.itermcolors' 'Custom Color Presets':'DoomOne'" ~/Library/Preferences/com.googlecode.iTerm2.plist

/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'Atom' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/pkgs/iterm/themes/Atom.itermcolors' 'Custom Color Presets':'Atom'" ~/Library/Preferences/com.googlecode.iTerm2.plist
