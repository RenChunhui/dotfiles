#!/bin/sh

# 预先循问管理员密码
sudo -v

# 保持活跃状态，直到完成
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sh $BIN_PATH/packages/os/screen.sh
sh $BIN_PATH/packages/os/finder.sh
sh $BIN_PATH/packages/os/dock.sh
sh $BIN_PATH/packages/os/photo.sh

sudo spctl --master-disable

printf "\e[0;32m  [✔] 设置完成，其中一些更改需要注销/重新启动才能生效\e[0m\n"
