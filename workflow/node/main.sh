#!/bin/sh
#
# node

echo "🕕 ${BOLD}installing node packages${RESET}"

if test ! $(which yarn); then
  brew install yarn
fi

cat $BIN_PATH/workflow/node/node.txt | xargs -n 1 yarn global add
