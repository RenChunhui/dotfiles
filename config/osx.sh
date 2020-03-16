#!/bin/sh

# 预先循问管理员密码
sudo -v

# 保持活跃状态，直到完成
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# 常规                                                                        #
###############################################################################

# 打开关闭窗口时禁用动画
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# 打开 Quick Look 窗口时禁用动画
defaults write -g QLPanelAnimationDuration -float 0



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



###############################################################################
# Finder                                                                      #
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
defaults write com.apple.finder AppleShowAllFiles -bool true;




###############################################################################
# Software update                                                             #
###############################################################################

# 禁用软件自动更新检查
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false


###############################################################################
# Spotlight                                                                   #
###############################################################################




###############################################################################
# SSD                                                                         #
###############################################################################


###############################################################################
# 其它                                                                         #
###############################################################################

# 阻止 Photo 自动打开
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# 杀掉影响进程的应用程序
for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "Safari" "SystemUIServer" "iCal"; do
  killall "${app}" &> /dev/null
done

sudo spctl --master-disable

printf "\e[0;32m  [✔] 设置完成，其中一些更改需要注销/重新启动才能生效\e[0m\n"
