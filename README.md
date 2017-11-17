# Ren Chunhui's Dotfiles 

本配置比较适合Web前端开发人员，打造 [iTerm]() + [Zsh]() + [Vim]()/[NeoVim]() + [Tmux]() 开发，自动补全使用效率好的[YouCompleteMe]()(已解决YouCompleteMe安装却提示需要Python的问题)

提示安装常用工具及App，如使用工具不一样的，可自已进行相关配置

## 安装

``` bash
$ git clone https://github.com/RenChunhui/dotfiles.git .dotfiles
$ cd .dotfiles
$ chmod +x ./install.sh
$ ./install.sh	
```

## Vim & NeoVim 安装

**插件YouCompleteMe所需的Python已在初使化环境中配置完成**

> 适合前端 Vue、React.js、Typescript 相关开发，

``` bash
$ cd ~/.vim/plugged/YouCompleteMe
$ ./install.py --js-completer
```

Vim

<img src="./screenshorts/vim.png" width="190%" height="100%">

NeoVim

<img src="./screenshorts/neovim.png" width="100%" height="100%">

YouCompleteMe

<img src="./screenshorts/YouCompleteMe.png" width="100%" height="100%">

## macOS 设置

``` bash
$ cd scripts
$ chmod +x ./osx.sh
$ ./osx.sh
```

## 参考
- [Nick Plekhanov's Dotfiles](https://github.com/nicksp/dotfiles.git)

## 许可证

[MIT license](LICENSE).
