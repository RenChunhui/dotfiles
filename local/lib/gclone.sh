#!/bin/sh

gclone() {
  repo_url="$1"
  dest_dir="${2:-}"
  repo_name=$(basename "$repo_url" .git)

  local progress="0"
  local status_file=$(mktemp)

  # 后台运行 git clone，并提取进度 + 捕获状态
  (
    git clone --progress "$repo_url" "$dest_dir" --depth=1 2>&1 |
    while IFS= read -r line; do
      if [[ "$line" =~ ([0-9]+)% ]]; then
        progress="${BASH_REMATCH[1]}"
        echo "$progress" > "$status_file"
      fi
    done
    echo $? > "${status_file}.exit"
  ) &

  clone_pid=$!

  # 改造 spinner，动态显示百分比
  enhanced_spinner() {
    local pid=$1
    local msg="$2"
    local done_msg="$3"
    local delay=0.1
    local i=0
    local chars='◐◓◑◒'
    local spinner_array=($(echo "$chars" | sed 's/\(.\)/\1 /g'))

    tput civis

    while kill -0 $pid 2>/dev/null; do
      local current_progress=$(cat "$status_file" 2>/dev/null || echo "0")

      printf "\r\033[2K"  # 清除整行
      printf "${GRAY}│   ├──${RESET} ${CYAN}%s${RESET} %-30s %s" "${spinner_array[i]}" "$repo_name" ${GRAY}"$current_progress%"${RESET}

      i=$(( (i+1) % ${#spinner_array[@]} ))
      sleep $delay
    done

    # 等待子进程结束，获取真实退出状态
    wait $pid
    exit_code=$(cat "${status_file}.exit" 2>/dev/null || echo "1")

    printf "\r\033[2K"  # 清除整行
    if [ "$exit_code" -eq 0 ]; then
      log ok "$(printf '%-30s' $repo_name) ${GRAY}cloned${RESET}"
    else
      log fail "$(printf '%-30s' $repo_name) ${GRAY}cloned${RESET}"
    fi

    rm -f "$status_file" "${status_file}.exit"
    tput cnorm
    return $exit_code
  }

  enhanced_spinner $clone_pid
}

