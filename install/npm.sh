#!/bin/sh
#
# Node packages.

packages=(
  sass
  typescript
  typescript-tslint-plugin
  javascript-typescript-langserver
  @angular/cli
  bash-language-server
  vscode-html-languageserver-bin
  vscode-css-languageserver-bin
  yaml-language-server
)

yarn global add "${packages[@]}"
