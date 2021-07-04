<div align="center">
  <img src="https://s1.ax1x.com/2020/04/04/G0HZUs.png">
  <p>使用自定义命令行管理你的 macOS</p>
</div>


<p align="center">
  <a href="https://github.com/RenChunhui/"><img alt="GitHub top language" src="https://img.shields.io/github/languages/top/renchunhui/dotfiles.svg"></a>
  <a href="https://github.com/RenChunhui/"><img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/renchunhui/dotfiles"></a>
  <a href="./LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/renchunhui/dotfiles"></a>
</p>

安装
---

> 目前几乎所有 `dotfiles` 配置都是放在 `$HOME` 目录下，当开发环境一多，`$HOME` 目录下有太多的隐藏文件，个人推荐放在 `$HOME/.config` 目录下。

``` sh
$ git clone https://github.com/renchunhui/dotfiles ~/.config/dotfiles
$ cd $HOME/.config/dotfiles
$ chmod +x ./install.sh
$ ./install.sh
```

功能
---

+ *install* 安装
  - *brew*    使用 Homebrew 安装软件及工具
  - *vscode*  安装 VSCode、VSCode 插件、习惯配置
  - *go*      安装 Go 环境
  - *iterm*   配置 iTerm2 环境(tmux、主题)
  - *node*    安装全局 node 工具包、语言补全引擎
  - *os*      macOS 系统设置
  - *vim*     安装 neovim 环境及配置
  - *zsh*     zsh 环境及插件安装

版权协议
---

[MIT License](./LICENSE)
