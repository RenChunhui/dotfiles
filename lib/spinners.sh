#!/bin/sh

spinner() {
  pid=$1
  delay=0.1
  spinstr='|/-\\'
  while [ "$(ps a | awk '{print $1}' | grep -e "^$pid$")" ]; do
    temp="${spinstr#?}"
    printf " [%c]  " "$spinstr"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}
