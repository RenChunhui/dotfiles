<div align="center">
  <img src="https://s1.ax1x.com/2020/04/04/G0HZUs.png">
  <p>使用自定义命令行管理你的 macOS</p>
</div>


<p align="center">
  <a href="https://github.com/RenChunhui/"><img alt="macOS Big Sur" src="https://img.shields.io/badge/-macOS_Big_Sur-9933CC?logo=Apple&logoColor=white"></a>
  <a href="https://github.com/RenChunhui/"><img alt="GitHub top language" src="https://img.shields.io/github/languages/top/renchunhui/dotfiles.svg"></a>
  <a href="https://github.com/RenChunhui/"><img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/renchunhui/dotfiles"></a>
  <a href="./LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/renchunhui/dotfiles"></a>
</p>


特性
---
* 模块化，便于安装及卸载，方便自定义。
* 所有安装只需国内环境即可完成，不依赖科学上网工具。
* ~~Homebrew 浅克隆~~

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
  - *brew*  使用 Homebrew 安装软件及工具
  - *code*  安装 VSCode、VSCode 插件、习惯配置
  - *emacs* 安装 Emacs 及相关配置
  - *git*   配置 git 环境
  - *go*    安装 Go 环境
  - *iterm* 配置 iTerm2 环境(tmux、主题)
  - *node*  安装全局 node 工具包、语言补全引擎
  - *os*    macOS 系统设置
  - *vim*   安装 vim 环境及配置
  - *zsh*   zsh 环境及插件安装
+ *uninstall* 卸载
  - *brew*  卸载 Brewfile 安装的软件、删除 Homebrew 及相关目录
  - *code*  卸载 VSCode、删除所有插件、删除配置文件
  - *emacs* 卸载 Emacs、删除配置
  - *git*   删除所有 git 配置
  - *go*    卸载 Go 环境
  - *node*  删除所有全局包
  - *vim*   移除 vim 配置
  - *zsh*   移除 `oh-my-zsh` 配置
+ *clean* 清理缓存
  - *brew*  清理 Homebrew 缓存
  - *node*  清理 npm、yarn 缓存
  - *log*   清理系统日志

版权协议
---

[MIT License](./LICENSE)
