#!/bin/sh

# 下载壁纸
if [ ! -d "$HOME/Pictures/Wallpapers" ]; then
  mkdir -p "$HOME"/Pictures/Wallpapers
  curl -s "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/canyon.jpg" -o "$HOME"/Pictures/Wallpapers/canyon.jpg
  curl -s "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/castle.jpg" -o "$HOME"/Pictures/Wallpapers/castle.jpg
  curl -s "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/road.jpg" -o "$HOME"/Pictures/Wallpapers/road.jpg
else
  log ok "$(printf '%-30s' wallpapers) ${GRAY}installed${RESET}"
fi

# 设置壁纸
osascript <<EOD
tell application "System Events"
	set picture of every desktop to POSIX file "$HOME/Pictures/Wallpapers/canyon.jpg"
end tell
EOD

# 安装 pywal
pipx install pywal
