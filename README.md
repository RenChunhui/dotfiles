# Dotfiles Manager #

### 工具、软件、插件等包

`packages` 目录

| 文件 | 命令 | 描述 |
| --- | --- | --- |
| brew.txt | dm add brew | 添加 brew 安装的工具包 |
| cask.txt | dm add cask | 添加 brew cask 安装的软件包 |
| code.txt | dm add code | 添加 VSCode 扩展插件 |
| fonts.txt | dm add fonts | 添加 NerdFonts 字体 |
| gem.txt | dm add gem | 添加 Ruby 包 |
| mas.txt | dm add mas | 安装 App Store 应用 |
| node.txt | dm add node | 安装全局 node 工具包 |

### 配置

`config` 目录

| 子目录 | 命令 | 描述 |
| --- | --- | --- |
| emacs | dm config emacs | 安装与下载自定义配置 Emacs |
| git | dm config git | 全局设置 git |
| iterm | dm config iterm | 自定义 iTerm2 配置 |
| osx | dm config osx | 设置 macOS |
| tmux | dm config tmux | 自定义 tmux 配置 |
| vim | dm config vim | vim 配置 |
| vscode | dm config code | VSCode 设置 |
| web | dm config web [options] | 安装前端 [options] 配置文件至当前目录 |
| zsh | dm config zsh | 安装 Oh-my-zsh 及插件 |
