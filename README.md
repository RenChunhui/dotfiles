<div align="center">
  <p>使用自定义命令行管理你的 macOS</p>
</div>

特性
---
* 模块化，便于自定义添加模块

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
* `dm <command>` 显示`plugins/{command}`模块的命令
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

* 第一步: 在 `dotfiles/plugins/` 目录下添加一个模块
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
$ dm ${自定义文件夹名}
```
