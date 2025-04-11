<div align="center">
  <h1>Chunhui's Dotfiles</h1>
  <p>终极 macOS 开发环境配置</p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-Sonoma-blue.svg" alt="macOS" >
  <img src="https://img.shields.io/github/forks/renchunhui/dotfiles?style=flat" alt="GitHub forks" >
  <img src="https://img.shields.io/github/stars/renchunhui/dotfiles?style=flat" alt="GitHub Repo stars" >
</p>

一套用于快速配置 macOS 开发环境的 dotfiles 集合，遵循 XDG Base Directory 规范，包含终端、编辑器、包管理等常用工具的配置。

[![asciicast](https://asciinema.org/a/714797.svg)](https://asciinema.org/a/714797)

## ✨ 功能特性

- 🛠️ **一键配置**：自动化安装完整的开发环境
- 💻 **终端增强**：Zsh + Oh My Zsh + 插件优化，提升效率
- 📦 **包管理**：集成 Homebrew、npm 和 pnpm 支持
- 🛡️ **安全整洁**：遵循 XDG Base Directory 规范
- 📝 **Git 最佳实践**：Angular 提交规范模板
- 🌈 **优雅安装**：可能是全网最漂亮的安装日志体验
  - 清晰的进度提示和错误处理
  - 层级分明的结构展示
  - 实时状态更新
  - 智能重试机制

## 🚀 快速开始

``` sh
$ git clone https://github.com/renchunhui/dotfiles.git ~/.config/dotfiles
$ cd ~/.config/dotfiles
$ chmod +x ./install.sh
$ ./install.sh
```

## 📁 目录结构

``` sh
dotfiles/
├── etc/               # 配置文件
│   ├── ghostty/       # Ghostty 终端配置
│   ├── git/           # Git 配置
│   ├── npm/           # npm 配置
│   ├── synology/      # Synology 配置
│   ├── tmux/          # Tmux 配置
│   └── zsh/           # Zsh 配置
├── local/             # 本地脚本
│   ├── lib/           # 库文件
│   └── libexec/       # 可执行脚本
├── Brewfile           # Homebrew 依赖
├── LICENSE            # 许可证
└── README.md          # 项目说明
```

## 🧰 包含的配置
- 终端 ：Zsh + Oh My Zsh + 插件
- 编辑器 ：Neovim + VS Code
- Git ：全局配置 + 提交模板
- 包管理 ：Homebrew, npm, pnpm
- 系统偏好 ：macOS 系统设置优化
- 工具 ：Ghostty, Tmux, Lazygit 等

## 📌 使用说明
1. 安装 ：运行 install.sh 脚本进行初始安装
2. 健康检查 ：运行 checkhealth.sh 检查系统配置
3. 偏好设置 ：运行 preference.sh 应用系统偏好设置
4. 配置更新 ：运行 configure.sh 更新配置文件

## 📄 许可证

[MIT License](./LICENSE)
