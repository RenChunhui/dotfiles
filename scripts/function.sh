#!/bin/bash

# INFO
print_info() {
  printf "\e[0;94m $1\e[0m\n"
}

# SUCCESS
print_success() {
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

# ERROR
print_error() {
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}
