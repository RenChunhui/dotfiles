#!/bin/sh

#######################################
# 帮助
#######################################
usage() {
cat <<EOF
Usage: dot uninstall [command]
Available Commands:
  brew     Homebrew 安装
  git      Git 环境
  iterm    终端配置
  macos    系统偏好设置
  neovim   NeoVim 配置
  node     Node 环境
  vscode   VSCode 开发环境
  zsh      zsh 环境
  help     帮助文档
EOF
}

#######################################
# 入口
#######################################
main() {
  case $1 in
    '')
      dot uninstall zsh
      dot uninstall brew
      dot uninstall git
      dot uninstall node
      dot uninstall iterm2
      dot uninstall vscode
      dot uninstall neovim
      dot uninstall macos
      ;;
    brew)
      sh $DOTDIR/user/brew/uninstall.sh
      ;;
    git)
      sh $DOTDIR/user/git/uninstall.sh
      ;;
    iterm2)
      sh $DOTDIR/user/iterm2/uninstall.sh
      ;;
    neovim)
      sh $DOTDIR/user/neovim/uninstall.sh
      ;;
    node)
      sh $DOTDIR/user/node/uninstall.sh
      ;;
    vscode)
      sh $DOTDIR/user/vscode/uninstall.sh
      ;;
    zsh)
      sh $DOTDIR/user/zsh/uninstall.sh
      ;;
    help)
      usage
      ;;
    *)
      echo "指定的命令无效. 请运行 dot uninstall help."
      ;;
  esac
}

main "$@"
