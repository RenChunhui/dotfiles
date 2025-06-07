#!/bin/sh

set -e

# 定义颜色
GREEN='#[fg=green]'
YELLOW='#[fg=yellow]'
RED='#[fg=red]'
BLUE='#[fg=blue]'
WHITE='#[fg=white]'
GRAY='#[fg=gray]'

# 获取 CPU 使用率
cpu_usage=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//' | awk '{printf "%.0f", $1}')

# 获取内存使用率
mem_used=$(vm_stat | awk '/Pages active/ {active=$3} /Pages wired down/ {wired=$4} END {print (active + wired) * 4096 / 1048576}')
mem_total=$(sysctl -n hw.memsize | awk '{print $1/1048576}')
mem_usage=$(echo "scale=1; $mem_used/$mem_total*100" | bc)

# 根据使用率设置颜色
cpu_color=$([ $(echo "$cpu_usage < 50" | bc) -eq 1 ] && echo $GREEN || ([ $(echo "$cpu_usage < 80" | bc) -eq 1 ] && echo $YELLOW || echo $RED))
mem_color=$([ $(echo "$mem_usage < 50" | bc) -eq 1 ] && echo $GREEN || ([ $(echo "$mem_usage < 80" | bc) -eq 1 ] && echo $YELLOW || echo $RED))

# 获取当前日期时间
current_time=$(date +"%H:%M")

echo "${cpu_color} ${cpu_usage}% | ${mem_color} ${mem_usage}% | 󱑉 ${current_time}"
