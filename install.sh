#!/bin/sh
#
# 安装脚本

set -e

# 引入辅助脚本
for script in $(pwd)/local/lib/*.sh; do
  . "$script"
done

echo ""
echo "${BOLD}macOS supported${RESET}"
echo "Easy setup for system packages, tools, and configs"
echo ""
echo "${BOLD}Author${RESET}: Chunhui Ren"
echo "${BOLD}GitHub${RESET}: https://github.com/renchunhui/dotfiles"
echo ""

# 获取 GitHub stars 和 forks 数量
echo "⏳ Fetching GitHub repository data, please wait..."
github_data=$(curl -s https://api.github.com/repos/renchunhui/dotfiles)
tput cuu1
tput el
get_stars=$(echo "$github_data" | awk -F'"stargazers_count": ' '{print $2}' | awk -F, '{print $1}' | xargs)
get_forks=$(echo "$github_data" | awk -F'"forks_count": ' '{print $2}' | awk -F, '{print $1}' | xargs)

printf "%s %s %s\n" "$(badge "STARS" "${get_stars}")" "$(badge "FORKS" "${get_forks}")" "$(badge "LICENSE" "MIT")"
echo ""

# 检查 sudo 密码
if ! sudo -n true 2>/dev/null; then
  echo "${BOLD}Please enter your sudo password (required for installation):${RESET}"
  sudo -v
fi

# 检查 Git 用户信息
if [ -z "$GIT_USER_NAME" ] || [ -z "$GIT_USER_EMAIL" ]; then
  printf "${BOLD}Please enter your Git username: ${GRAY}"
  read -r GIT_USER_NAME
  printf "${RESET}"
  printf "${BOLD}Please enter your Git email: ${GRAY}"
  read -r GIT_USER_EMAIL
  printf "${RESET}"
fi

# 引入执行脚本
while true; do sudo -n true; sleep 60; done 2>/dev/null &
KEEP_ALIVE_PID=$!
echo "${BOLD}dotfiles${RESET}"
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
