#!/bin/sh

set -e

source "$(pwd)/lib/chalk.sh"

group "Pacman"

archlinuxcn() {
  cat <<EOF > /etc/pacman.conf
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch
EOF
  sudo pacman-key --lsign-key "farseerfc@archlinux.org"
  ok "Archlinuxcn"
}

pkgs() {
  while IFS= read -r file; do
    sudo pacman -S $file
    ok $file
  done < "$(pwd)/var/Pacmanfile"
}

main() {
  sudo pacman -Syu
  archlinuxcn
  pkgs
}

main
