#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/function.sh

COMMENT=\#*

find * -name "*.list" | while read fn; do
  cmd="${fn%.*}"
  set -- $cmd

  print_info "Installing $1 packages..."

  while read package; do
    if [[ $package == $COMMENT ]];
    then continue
    fi

    print_info "Installing $package..."

    if [[ $cmd == code* ]]; then
      $cmd $package
    else
      $cmd install $package
    fi
  done < "$fn"
  print_success "Finished Installing $1 packages."
done
