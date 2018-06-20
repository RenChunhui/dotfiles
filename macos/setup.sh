#!/usr/bin/env bash

# 预先循问管理员密码
sudo -v

# 保持活跃状态，直到完成
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# 常规设置                                                                     #
###############################################################################

# 在启动时禁用声音效果
sudo nvram SystemAudioVolume=" "

# 默认保存到硬盘
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# 删除 "打开方式" 中的重复选项
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# 禁用崩溃反馈
defaults write com.apple.CrashReporter DialogType -string "none"

# 电脑死机时自动重启
sudo systemsetup -setrestartfreeze on

# 切勿进入电脑睡眠模式
sudo systemsetup -setcomputersleep Off > /dev/null

# 打开关闭窗口时禁用动画
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# 打开 Quick Look 窗口时禁用动画
defaults write -g QLPanelAnimationDuration -float 0




###############################################################################
# 固态硬盘                                                                     #
###############################################################################

# 禁用休眠（加速进入睡眠模式）
sudo pmset -a hibernatemode 0

# 删除硬盘睡眠映像文件以节省空间
sudo rm /Private/var/vm/sleepimage
# 创建一个0字节的文件
sudo touch /Private/var/vm/sleepimage
# 确保他不能被重写
sudo chflags uchg /Private/var/vm/sleepimage

# 禁用运动传感器
sudo pmset -a sms 0


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

# 启用HiDPI显示模式（需要重新启动）
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true



###############################################################################
# Finder                                                                      #
###############################################################################

# 禁用窗口动画和获取信息动画
defaults write com.apple.finder DisableAllAnimations -bool true

# 显示文件的扩展名
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 显示状态栏
defaults write com.apple.finder ShowStatusBar -bool true

# 显示路径栏
defaults write com.apple.finder ShowPathbar -bool true

# 更改文件名时不警告
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# 避免在网络卷上创建.DS_Store文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# 默认情况下，在所有Finder窗口中使用列表视图
# 其他视图模式的四字母代码：`icnv`，`clmv`，`Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# 清空垃圾箱前不显示警告
defaults write com.apple.finder WarnOnEmptyTrash -bool false



###############################################################################
# Dock, Dashboard                                                             #
###############################################################################

# Dock 项目图标大小设置
defaults write com.apple.dock tilesize -int 48

# 最小化/最大化窗口效果
defaults write com.apple.dock mineffect -string "scale"

# Dock 打开应用时禁用动画
defaults write com.apple.dock launchanim -bool false

# 启用 Spotlight
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist



###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# 使用 UTF-8 编码
defaults write com.apple.terminal StringEncodings -array 4

# iTerm2 - 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# iTerm2 - 字体设置
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' DroidSansMonoNerdFontC- 13" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' DroidSansMonoNerdFontC- 13" ~/Library/Preferences/com.googlecode.iTerm2.plist




###############################################################################
# Others                                                                      #
###############################################################################

# 阻止 Photo 自动打开
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

sudo spctl --master-disable



###############################################################################
# VSCode                                                                      #
###############################################################################

# For VS Code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# For VS Code Insider
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# If necessary, reset global default
defaults delete -g ApplePressAndHoldEnabled



###############################################################################
# Xcode                                                                       #
###############################################################################

# 移除所有不可用模拟器
xcrun simctl delete unavailable

printf "\e[0;32m  [✔] 设置完成，其中一些更改需要注销/重新启动才能生效\e[0m\n"
