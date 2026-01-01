#!/bin/sh
# ============================================
# Description : 入口安装文件
# Usage       : ./install.sh
# Author      : Chunhui Ren
# Email       : renchunhui2008@gmail.com
# ============================================

set -e

# 引入辅助脚本
for script in $(pwd)/local/lib/*.sh; do
  . "$script"
done

cat <<EOF
              __     __  ____ __
          ___/ /__  / /_/ _(_) /__ ___
         / _  / _ \/ __/ _/ / / -_|_-<
         \_,_/\___/\__/_//_/_/\__/___/

───────────────────────────────────────────────
     macOS development environment setup
───────────────────────────────────────────────
${BOLD}Platform${RESET}   : $(platform)
${BOLD}Network${RESET}    : $(net_status)
EOF

# 安装 Homebrew
printf "${BOLD}Homebrew${RESET}   : Installing... \r"
if ! command -v brew &> /dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
  if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  printf "${BOLD}Homebrew${RESET}   : ${GREEN}Installed${RESET}       \n"
else
  printf "${BOLD}Homebrew${RESET}   : ${GREEN}Installed${RESET}       \n"
fi

echo "───────────────────────────────────────────────"

# 检查 sudo 密码
if ! sudo -n true 2>/dev/null; then
  echo "${CYAN}◆${RESET}  ${BOLD}Please enter your sudo password:${RESET}"
  printf "${GRAY}│${RESET}  "
  sudo -v
fi

# git user 配置
if [ ! -f $XDG_CONFIG_HOME/git/config ]; then
  echo "${CYAN}◆${RESET}  ${BOLD}Please enter your git username:${RESET}"
  read -p "${GRAY}│${RESET}  " GIT_USER_NAME
  echo "${CYAN}◆${RESET}  ${BOLD}Please enter your git email:${RESET}"
  read -p "${GRAY}│${RESET}  " GIT_USER_EMAIL
fi

# 引入执行脚本
while true; do sudo -n true; sleep 60; done 2>/dev/null &
KEEP_ALIVE_PID=$!

for script in $(pwd)/local/libexec/*.sh; do
  . "$script"
done
kill $KEEP_ALIVE_PID

echo ""
echo "${BOLD}🎉 Installation complete!${RESET}"
echo ""
echo "${DIM}⚠️ Some changes require logout/restart to take effect${RESET}"
echo ""
echo "${BOLD}🙏 If you find this project helpful, please give me a ⭐️!${RESET}"
echo "📚 GitHub URL: ${UNDERLINE}https://github.com/renchunhui/dotfiles${RESET}"
echo ""
