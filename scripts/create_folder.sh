#!/bin/sh
#
# 创建文件夹

source $DOTPATH/lib/console

folders=(
  backup
  github
  manual
  temp
  workspace
)

for folder in "${folders[@]}"; do
  if [[ ! -d "$HOME/Documents/$folder" ]]; then
    mkdir $HOME/Documents/$folder
  fi

  ok "Create $folder directory successfully."
done
