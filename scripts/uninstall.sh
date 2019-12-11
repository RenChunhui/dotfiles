#!/bin/sh

source $PWD/lib/echo.sh

bytesToHuman() {
  b=${1:-0}; d=''; s=0; S=(Bytes {K,M,G,T,E,P,Y,Z}iB)
  while ((b > 1024)); do
      d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
      b=$((b / 1024))
      (( s++ ))
  done
  ok "$b$d ${S[$s]} of space was cleaned up"
}

# Ask for the administrator password upfront
sudo -v

# Keep-alive sudo until `clenaup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

oldAvailable=$(df / | tail -1 | awk '{print $4}')

info 'Empty the Trash on all mounted volumes and the main HDD...'
sudo rm -rfv /Volumes/*/.Trashes/* &>/dev/null
sudo rm -rfv ~/.Trash/* &>/dev/null

info 'Clear System Log Files...'
sudo rm -rfv /var/log/*
sudo rm -rfv /private/var/log/*
sudo rm -rfv /Library/Logs/*

info 'Cleanup cache...'
rm -rfv ~/Library/Caches/*

if type "brew" &>/dev/null; then
  info 'Cleanup Homebrew Cache...'
  brew cleanup -s &>/dev/null
  brew cask cleanup &>/dev/null
  rm -rfv $(brew --cache) &>/dev/null
  brew tap --repair &>/dev/null
fi

if type "gem" &> /dev/null; then
  info 'Cleanup any old versions of gems'
  gem cleanup &>/dev/null
fi

if type "docker" &> /dev/null; then
  info 'Cleanup Docker'
  docker system prune -af
fi

if type "npm" &> /dev/null; then
  info 'Cleanup npm cache...'
  npm cache clean --force
fi

if type "yarn" &> /dev/null; then
  info 'Cleanup Yarn Cache...'
  yarn cache clean --force
fi

info 'Purge inactive memory...'
sudo purge

ok 'Success!'

newAvailable=$(df / | tail -1 | awk '{print $4}')
count=$((oldAvailable - newAvailable))
bytesToHuman $count
