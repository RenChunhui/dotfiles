#!/bin/sh
#
# 旋转器

# 彩色定义（使用 tput，兼容大多数终端）
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

# Spinner 字符集，可自定义
SPINNER_CHARS='◐◓◑◒'

spinner() {
    local pid=$1
    local start_msg="$2"
    local end_msg="$3"
    local delay=0.1
    local i=0
    local chars=$(echo "$SPINNER_CHARS" | sed 's/\(.\)/\1 /g')
    local spinner_array=($chars)

    tput civis  # 隐藏光标

    while kill -0 $pid 2>/dev/null; do
        printf "\r\033[2K"  # 清除整行
        printf "${GRAY}│   ├──${RESET} ${CYAN}%s ${RESET}%s" "${spinner_array[i]}" "$start_msg"
        i=$(( (i+1) % ${#spinner_array[@]} ))
        sleep $delay
    done

    wait $pid
    exit_code=$?

    printf "\r\033[2K"  # 再次清除整行
    if [ $exit_code -eq 0 ]; then
        printf "${GRAY}│   ├──${RESET} ${GREEN}●${RESET} %s\n" "$end_msg"
    else
        printf "${GRAY}│   ├──${RESET} ${RED}●${RESET} %s (失败)\n" "$end_msg"
    fi

    tput cnorm  # 恢复光标
}
