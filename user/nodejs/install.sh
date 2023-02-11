#!/bin/sh
#
# NodeJS

if ! command -v pnpm >/dev/null 2>&1; then
  brew install pnpm
fi
