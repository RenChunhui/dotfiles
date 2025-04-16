<div align="center"> 
  <h1>Chunhui's Dotfiles</h1> 
  <p>Your ultimate macOS development environment setup</p>
</div> 

<p align="center"> 
  <img src="https://img.shields.io/badge/macOS-Sonoma-blue.svg" alt="macOS" > 
  <img src="https://img.shields.io/github/forks/renchunhui/dotfiles?style=flat" alt="GitHub forks" > 
  <img src="https://img.shields.io/github/stars/renchunhui/dotfiles?style=flat" alt="GitHub Repo stars" > 
</p>

<p align="center">
  <a href="README_zh-CN.md">
    <img src="https://img.shields.io/badge/Language-English-blue" alt="简体中文">
  </a>
  <a href="README.md">
    <img src="https://img.shields.io/badge/语言-简体中文-red" alt="English">
  </a>
</p>

A minimal, extensible dotfiles setup for macOS developers.Follows the XDG Base Directory specification and includes configurations for terminal, editors, package managers, and more.

[![asciicast](https://asciinema.org/a/714797.svg)](https://asciinema.org/a/714797)

## ✨ Features

- 🛠️ Automated Setup: One-click installation of the full dev environment
- 💻 Terminal Optimization: Zsh + Oh My Zsh + plugin setup
- 📦 Package Management: Integrated Homebrew, npm, pnpm
- 🎨 Theme Support: Comes with Catppuccin themes
- 🛡️ Secure & Clean: XDG Base Directory compliant
- 📝 Git Commit Template: Follows Angular commit convention
- 🌈 **Elegant Installation**: Possibly the most beautiful installation log experience, featuring:
  - Clear progress tracking and error handling
  - Hierarchical structure display
  - Real-time status updates
  - Intelligent retry mechanism
  
## 🚀 Quick Start

```sh
$ git clone https://github.com/renchunhui/dotfiles.git ~/.config/dotfiles
$ chmod +x ./install.sh
$ ./install.sh
```
## 📁 Directory Structure

```sh
dotfiles/
├── etc/               # Configuration files
│   ├── ghostty/       # Ghostty terminal configuration
│   ├── git/           # Git configuration
│   ├── npm/           # npm configuration
│   ├── synology/      # Synology configuration
│   ├── tmux/          # Tmux configuration
│   └── zsh/           # Zsh configuration  
├── local/             # Local scripts
│   ├── lib/           # Library files
│   └── libexec/       # Executable scripts
├── Brewfile           # Homebrew dependencies
├── LICENSE            # License
└── README.md          # Project documentation
```
## 🧰 Included Configurations 

- Terminal: Zsh + Oh My Zsh + Plugins
- Editor: Neovim + VS Code
- Git: Global configuration + Commit template
- Package Management: Homebrew, npm, pnpm
- System Preferences: Optimized macOS system settings
- Utilities: Ghostty, Tmux, Lazygit, etc.

## 📌 Usage Instructions  

1. Install: Run install.sh to set up the environment
2. Health Check: Run checkhealth.sh to verify system configuration
3. Customize: Modify configurations as needed
4. Update Configs: Run configure.sh to sync the latest settings

## 📄 License

[MIT License](./LICENSE)
