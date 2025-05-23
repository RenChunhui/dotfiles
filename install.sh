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
${BOLD}Platform${RESET} : $(platform)
${BOLD}Network${RESET}  : $(net_status)
───────────────────────────────────────────────
EOF

# 检查 sudo 密码
if ! sudo -n true 2>/dev/null; then
  echo "${CYAN}◆${RESET}  ${BOLD}Please enter your sudo password:${RESET}"
  printf "${GRAY}│${RESET}  "
  sudo -v
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
