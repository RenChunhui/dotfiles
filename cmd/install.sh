#!/bin/sh

usage() {
cat <<EOF
Usage: dot install [command]

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

main() {
  case $1 in
    '')
      dot install zsh
      dot install brew
      dot install git
      dot install node
      dot install iterm
      dot install neovim
      dot install macos
      ;;
    brew)
      sh $DOTPATH/local/brew/install.sh
      ;;
    git)
      sh $DOTPATH/local/git/install.sh
      ;;
    iterm)
      sh $DOTPATH/local/iterm/install.sh
      ;;
    macos)
      sh $DOTPATH/local/macos/install.sh
      ;;
    neovim)
      sh $DOTPATH/local/neovim/install.sh
      ;;
    node)
      sh $DOTPATH/local/node/install.sh
      ;;
    zsh)
      sh $DOTPATH/local/zsh/install.sh
      ;;
    help)
      usage
      ;;
    *)
      echo "指定的命令无效. 请运行 dot install help."
      ;;
  esac
}

main "$@"
