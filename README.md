<div align="center">
  <img src="https://s1.ax1x.com/2020/04/04/G0HZUs.png">
  <p>使用自定义命令行管理你的 macOS</p>
</div>

- - -

<p align="center">
  <a href="https://github.com/RenChunhui/"><img alt="GitHub top language" src="https://img.shields.io/github/languages/top/renchunhui/dotfiles.svg"></a>
  <a href="https://github.com/RenChunhui/"><img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/renchunhui/dotfiles"></a>
  <a href="./LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/renchunhui/dotfiles"></a>
</p>

- - -

特性
---
* 模块化，便于自定义模块及选择性配置。

安装
---

> 目前几乎所有 `dotfiles` 配置都是放在 `$HOME` 目录下，当开发环境一多，`$HOME` 目录下有太多的隐藏文件，个人推荐放在 `$HOME/.config` 目录下。

``` sh
$ git clone https://github.com/renchunhui/dotfiles ~/.config/dotfiles
$ cd $HOME/.config/dotfiles
$ chmod +x ./install.sh
$ ./install.sh
```

如何使用
---

* `dm` 为自定义命令行工具
* `dm <command>` 显示`modules/{command}`模块的命令
* `dm <command> <option>` 执行此模块的选项功能

例如:

``` bash
$ dm brew install       # Homebrew 包安装
$ dm git proxy          # 设置 Git 走代理
$ dm node install       # 全局安装 node 包
$ dm os restart         # 重启电脑
```

自定义
---

* **第一步**: 添加一个模块

``` sh
$ cd ~/.config/dotfiles/modules
$ mkdir ${moduleName}
```
* **第二步**: 添加默认文件 `main.sh`

``` sh
$ cd ${moduleName}
$ touch main.sh
```
* **第三步**: 自定义模块脚本:

``` sh
case $1 in
'' | 'h' | 'help')
  # 自定义帮助文档
  ;;
# 自定义选项如 install
'install')
  # 自定义选项功能
  ;;
*)
  # 输入不存在的命令错误提示
  ;;
esac
```

* 查看效果
``` sh
$ dm ${moduleName}
```

FAQ
---
查看 [Wiki](https://github.com/RenChunhui/dotfiles/wiki)

版权协议
---

[MIT License](./LICENSE)
