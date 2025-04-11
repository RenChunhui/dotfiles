#!/bin/sh

install_with_brew() {
  local total=$(grep -v '^$' "$1" | grep -v '^#' | wc -l | awk '{print $1}')
  local count=0
  local max_retries=3

  while read -r line; do
    count=$((count + 1))
    package=$(echo "$line" | awk -F'"' '{print $2}')

    # 检查是否已经安装
    if brew list "$package" &>/dev/null; then
      log ok "$(printf '%-30s' ${package}) ${GRAY}[$(printf "%02d" $count)/$total] installed${RESET}"
      continue
    fi

    retry_count=0

    while [[ $retry_count -lt $max_retries ]]; do
      if [[ "$line" == *"brew"* ]]; then
        (brew install "$package" --quiet &>/dev/null) &
        spinner $! "$(printf '%-30s' ${package}) ${GRAY}[$(printf "%02d" $count)/$total] installing...${RESET}" "$(printf '%-30s' ${package}) ${GRAY}[$(printf "%02d" $count)/$total] installed${RESET}"
      fi

      if [[ "$line" == *"cask"* ]]; then
        (brew install --cask "$package" --quiet &>/dev/null) &
        spinner $! "$(printf '%-30s' ${package}) ${GRAY}[$(printf "%02d" $count)/$total] installing...${RESET}" "$(printf '%-30s' ${package}) ${GRAY}[$(printf "%02d" $count)/$total] installed${RESET}"
      fi

      # 检查是否成功
      if [[ $? -eq 0 ]]; then
        break
      else
        retry_count=$((retry_count + 1))
        log warn "Installation failed, retrying ($retry_count/$max_retries): $package"
      fi
    done

    # 如果达到最大重试次数仍然失败
    if [[ $retry_count -eq $max_retries ]]; then
      log fail "Failed to install: $package"
    fi
  done < "$1"
}
