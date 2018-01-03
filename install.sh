#!/bin/bash

# Prompting for sudo password
. scripts/function.sh

print_info 'Prompting for sudo password...'
if sudo -v; then
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    print_success "Sudo credentials updated."
else
    print_error "Failed to obtain sudo credentials."
fi

# Installing XCode command line tools

print_info "Installing XCode command line tools..."
if xcode-select --install; then
    print_success "Finished installing XCode command line tools."
else
    print_error "Failed to install XCode command line tools."
fi

source packages/setup.sh
source zsh/setup.sh
source macos/setup.sh

source scripts/symlink-dotfiles.sh
