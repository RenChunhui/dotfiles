#!/usr/bin/env bash

source ./lib/echo.sh
source ./lib/require.sh


# 清理缓存文件
rm -rf ~/Library/Caches/*

# 系统缓存文件
sudo rm -rf /Library/Caches/*

# 清理日志文件
rm -rf ~/Library/logs/*

# 系统日志文件
sudo rm -rf /Library/logs/*
sudo rm -rf /var/log/*
sudo rm -rf /private/var/folders/*

# 应用程序缓存文件
for x in $(ls ~/Library/Containers/)
do
    # echo "cleaning ~/Library/Containers/$x/Data/Library/Caches/"
    rm -rf ~/Library/Containers/$x/Data/Library/Caches/*
    # echo "done cleaning ~/Library/Containers/$x/Data/Library/Caches"
done
