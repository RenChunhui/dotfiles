#!/usr/bin/env bash

function require_cask() {
    running "brew cask $1"
    brew cask list $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "brew cask install $1"
        brew cask install $1
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            # exit -1
        fi
    fi
    ok
}

function require_brew() {
    running "brew $1"
    brew list $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "brew install $1"
        brew install $1
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            # exit -1
        fi
    fi
    ok
}

# mas
function require_mas() {
    running "mas install $1"
    # mas list $1 > /dev/null 2>&1 | true
    mas list | grep $1@ > /dev/null
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "mas install $1"
        mas install $1
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            # exit -1
        fi
    fi
    ok
}

# global node_modules
function require_yarn() {
  running "yarn global add $1"
  yarn global list --depth 0 | grep $1@ > /dev/null
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    action "yarn global add $1"
    yarn global add $1
  fi
  ok
}

# vscode plugins
function require_code() {
  running "code --install-extension $1"
  code --list-extensions --depth 0 | grep $1@ > /dev/null

  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    action "code --install-extension $1"
    code --install-extension $1
  fi
  ok
}
