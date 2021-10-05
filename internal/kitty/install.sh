#!/bin/sh
#
# 安装 Kitty 终端

rm -rf $HOME/.config/kitty/kitty.conf
cp $DOTPATH/internal/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# tmux
cp cp $DOTPATH/internal/kitty/tmux.conf $HOME/.tmux.conf
