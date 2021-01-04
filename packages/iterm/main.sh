#!/bin/sh

cp $BIN_PATH/packages/iterm/hushlogin $HOME/.hushlogin
cp $BIN_PATH/packages/iterm/tmux.conf $HOME/.tmux.conf

# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 自定义字体
# /usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' SFMono Nerd Font-Regular 12" ~/Library/Preferences/com.googlecode.iTerm2.plist
# /usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' SFMono Nerd Font-Regular 12" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Import ayu theme
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'ayu' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/packages/iterm/themes/ayu.itermcolors' 'Custom Color Presets':'ayu'" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Import ayu_light theme
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'ayu_light' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/packages/iterm/themes/ayu_light.itermcolors' 'Custom Color Presets':'ayu_light'" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Import DoomOne theme
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'DoomOne' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/packages/iterm/themes/DoomOne.itermcolors' 'Custom Color Presets':'DoomOne'" ~/Library/Preferences/com.googlecode.iTerm2.plist
