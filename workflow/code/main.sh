#!/bin/sh
#
# VSCode 环境安装

echo "🕒 ${BOLD}VSCode installing${RESET}"

if test ! $(which code); then
  brew cask install visual-studio-code
fi

cat $BIN_PATH/workflow/code/code.txt | xargs -n 1 code --install-extension

rm -rf $HOME/Library/Application\ Support/Code/User/settings.json
sudo ln -s $HOME/.config/dotfiles/workflow/code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
