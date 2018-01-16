#!/usr/bin/env bash

# 消息
msg() {
  echo "🍺 $1" | cecho Cyan
}

# 正确
success() {
  echo "🍻 $1" | cecho Green
}

# 错误
error() {
  echo "❌ $1" | cecho Red
}
