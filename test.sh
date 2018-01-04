#!/bin/bash

. scripts/function.sh

print_info 'Prompting for sudo password...'
if sudo -v; then
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    print_success "Sudo credentials updated."
else
    print_error "Failed to obtain sudo credentials."
fi
