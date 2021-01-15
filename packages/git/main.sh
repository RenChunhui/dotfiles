#!/bin/sh
#
# 设置 Git 环境



main() {
    cp $BIN_PATH/packages/git/gitconfig $HOME/.gitconfig
    cp $BIN_PATH/packages/git/gitmessage $HOME/.gitmessage
}

main "$@"