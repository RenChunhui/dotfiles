#!/bin/sh

set -e

log group "System Preferences"

###############################################################################
# 常规                                                                        #
###############################################################################

###############################################################################
# 访达                                                                        #
###############################################################################

# 禁用窗口动画和获取信息动画
defaults write com.apple.finder DisableAllAnimations -bool true

# 不显示文件的扩展名
defaults write NSGlobalDomain AppleShowAllExtensions -bool false

# 显示状态栏
defaults write com.apple.finder ShowStatusBar -bool true

# 显示路径栏
defaults write com.apple.finder ShowPathbar -bool true

# 更改文件名时不警告
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# 避免在网络卷上创建.DS_Store文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# 清空垃圾箱前不显示警告
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# 显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles -bool true

log ok "$(printf '%-30s' Finder) ${GRAY}defaults${RESET}"

###############################################################################
# 程序坞                                                                       #
###############################################################################

# Dock 项目图标大小设置
defaults write com.apple.dock tilesize -int 48

# 最小化/最大化窗口效果
defaults write com.apple.dock mineffect -string "scale"

# Dock 打开应用时禁用动画
defaults write com.apple.dock launchanim -bool false

# 不显示最近应用
defaults write com.apple.dock show-recents -bool false

# 重新整理 Dock
defaults delete com.apple.dock persistent-apps

# 重启程序坞
dock_item() {
  printf '%s%s%s%s%s' \
    '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
    '<key>_CFURLString</key><string>' \
    "$1" \
    '</string><key>_CFURLStringType</key><integer>0</integer>' \
    '</dict></dict></dict>'
}

defaults write com.apple.dock \
  persistent-apps -array "$(dock_item '/System/Applications/Launchpad.app')" \
  "$(dock_item '/Applications/Google Chrome.app')" \
  "$(dock_item '/System/Applications/Mail.app')" \
  "$(dock_item '/Applications/WeChat.app')" \
  "$(dock_item '/Applications/QQ.app')" \
  "$(dock_item '/Applications/Visual Studio Code.app')" \
  "$(dock_item '/Applications/Ghostty.app')" \
  "$(dock_item '/System/Applications/System Settings.app')"
killall Dock

log ok "$(printf '%-30s' Dock) ${GRAY}defaults${RESET}"

###############################################################################
# 屏幕                                                                        #
###############################################################################

# 睡眠或屏幕保护程序开始后立即需要密码
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# 屏幕截屏保存到桌面
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# 保存格式为 JPG
defaults write com.apple.screencapture type -string "jpg"

# 截图禁用阴影
defaults write com.apple.screencapture disable-shadow -bool true

# 在非Apple LCD上启用亚像素字体渲染
defaults write NSGlobalDomain AppleFontSmoothing -int 2

log ok "$(printf '%-30s' Screen) ${GRAY}defaults${RESET}"

###############################################################################
# 聚焦                                                                        #
###############################################################################

# 禁用 Spotlight
# launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

###############################################################################
# 相册                                                                        #
###############################################################################

# 阻止 Photo 自动打开
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

log ok --last "$(printf '%-30s' Photos) ${GRAY}defaults${RESET}"

###############################################################################
# 邮箱                                                                        #
###############################################################################

###############################################################################
# 浏览器                                                                       #
###############################################################################

###############################################################################
# 键盘                                                                        #
###############################################################################

# 禁用 Spotlight 搜索快捷键
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys --dict-add 64 "{ enabled = 0 }"
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys --dict-add 65 "{ enabled = 0 }"

# log ok "$(printf '%-30s' Keyboards) ${GRAY}defaults${RESET}"

###############################################################################
# Xcode                                                                       #
###############################################################################

# 删除所有不可用的模拟器
# xcrun simctl delete unavailable

###############################################################################
# 安全与隐私                                                                    #
###############################################################################

# 允许任何来源下载的 App
# sudo spctl --master-disable

# log ok "Security & Privacy"
