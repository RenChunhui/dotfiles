#!/bin/sh

if [[ ! -d $XDG_CONFIG_HOME/tmux ]]; then
  cp -R $DOTDIR/etc/tmux $XDG_CONFIG_HOME/tmux
fi

echo "✔ tmux"

if [[ ! -f $HOME/.hushlogin ]]; then
  touch $HOME/.hushlogin
fi
echo "✔ hushlogin"

# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 自定义字体
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' SFMono-Regular 14" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' SymbolsNerdFontCompleteM-1000-em 14" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo "✔ Fonts"

# 导入主题
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'GitHub Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$DOTDIR/etc/iterm2/GitHub Dark.itermcolors' 'Custom Color Presets':'GitHub Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo "✔ GitHub Dark Theme"
