#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/function.sh

COMMENT=\#*

sudo -v

print_info "Installing Brewfile packages..."
brew bundle
brew install yarn mas
print_success "Finished installing Brewfile packages."

find * -name "*.list" | while read fn; do
  path=${fn%.*}
  cmd=${path#*/}
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
