<div align="center">
  <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iOTZweCIgaGVpZ2h0PSI5NnB4IiB2aWV3Qm94PSIwIDAgOTYgOTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8ZyBpZD0iUGl4ZWwtMiIgc3Ryb2tlPSJub25lIiBzdHJva2Utd2lkdGg9IjEiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgaWQ9Iue8lue7hCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTYuMDAwMDAwLCAxNi4wMDAwMDApIj4KICAgICAgICAgICAgPHBhdGggZD0iTTMyLDAgQzQ5LjY3MzExMiwwIDY0LDE0LjMyNjg4OCA2NCwzMiBDNjQsNDkuNDk2MzgwOSA0OS45NTgyMTcxLDYzLjcxMzEyNzYgMzIuNTI5MTc4NSw2My45OTU3MTI5IEwzMiw2NCBMNCw2NCBDMS43OTA4NjEsNjQgMi43MDU0MTVlLTE2LDYyLjIwOTEzOSAwLDYwIEwwLDE2IEwxNiwwIEwzMiwwIFogTTQwLDI0IEMzNS41ODE3MjIsMjQgMzIsMjcuNTgxNzIyIDMyLDMyIEMzMiwzNi40MTgyNzggMzUuNTgxNzIyLDQwIDQwLDQwIEM0NC40MTgyNzgsNDAgNDgsMzYuNDE4Mjc4IDQ4LDMyIEM0OCwyNy41ODE3MjIgNDQuNDE4Mjc4LDI0IDQwLDI0IFoiIGlkPSLlvaLnirbnu5PlkIgiIGZpbGw9IiM1Njg1RkYiPjwvcGF0aD4KICAgICAgICAgICAgPHBvbHlnb24gZmlsbD0iIzM1NThCRSIgcG9pbnRzPSI4IDggMTYgMCAyMCAyMCAwIDE2Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGZpbGw9IiNBREM3RkYiIHBvaW50cz0iOCA4IDE2IDAgMTYgMTYgMCAxNiI+PC9wb2x5Z29uPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+">
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
dm brew install       # Homebrew 包安装
dm git proxy          # 设置 Git 走代理
dm node install       # 全局安装 node 包
dm os restart         # 重启电脑
```

自定义
---

* 第一步: 在 `dotfiles/modules/` 目录下添加一个模块
* 第二步: 添加默认文件 `main.sh`
* 第三步: 编写初使化代码:

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

版权协议
---

[MIT License](./LICENSE)
