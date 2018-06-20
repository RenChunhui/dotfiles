# macOS 配置文件

![license](https://img.shields.io/github/license/renchunhui/dotfiles.svg)
![homebrew](https://img.shields.io/homebrew/v/cake.svg)
![GitHub language count](https://img.shields.io/github/languages/count/RenChunhui/dotfiles.svg)

![GitHub followers](https://img.shields.io/github/followers/renchunhui.svg?style=social&label=Follow)
![GitHub stars](https://img.shields.io/github/stars/RenChunhui/dotfiles.svg?style=social&label=Stars)
![Twitter Follow](https://img.shields.io/twitter/follow/renchunhui2008.svg?style=social&label=Follow)


## 安装

全局安装

``` bash
$ git clone https://github.com/RenChunhui/dotfiles.git .dotfiles
$ cd .dotfiles
$ make install
```

brew 安装包

>  可根据自身常用工具软件更改 Brewfile 配置

``` bash
$ make brew
```

Ruby 包安装

> 可根据自身情况更改 Gemfile 配置

``` bash
$ make gem
```

字体安装

``` bash
$ make font
```

Visual Studio Code 插件

> 可根据自身习惯更改 Makefile 内 vscode 部分的配置

``` bash
$ make vscode
```

Oh-my-Zsh

``` bash
$ make zsh
```

常用配置

``` bash
$ make symlinks
```

系统设置

``` bash
$ make osx
```

