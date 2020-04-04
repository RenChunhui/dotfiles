<div align="center">
  <?xml version="1.0" encoding="UTF-8"?>
  <svg width="96px" height="96px" viewBox="0 0 96 96" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <g id="Pixel-2" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g id="编组" transform="translate(16.000000, 16.000000)">
              <path d="M32,0 C49.673112,0 64,14.326888 64,32 C64,49.4963809 49.9582171,63.7131276 32.5291785,63.9957129 L32,64 L4,64 C1.790861,64 2.705415e-16,62.209139 0,60 L0,16 L16,0 L32,0 Z M40,24 C35.581722,24 32,27.581722 32,32 C32,36.418278 35.581722,40 40,40 C44.418278,40 48,36.418278 48,32 C48,27.581722 44.418278,24 40,24 Z" id="形状结合" fill="#5685FF"></path>
              <polygon fill="#3558BE" points="8 8 16 0 20 20 0 16"></polygon>
              <polygon fill="#ADC7FF" points="8 8 16 0 16 16 0 16"></polygon>
          </g>
      </g>
  </svg>
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
