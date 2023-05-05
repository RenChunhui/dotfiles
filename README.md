<div align="center">
  <h1>Dotfiles</h1>
  <p>Automated configuration, Preferences and software Installation for macOS.</p>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Ventura-000000?style=for-the-badge&logo=Apple&logoColor=white" alt="macOS">
  <img src="https://img.shields.io/badge/Homebrew-000?logo=homebrew&logoColor=FBB040&style=for-the-badge" alt="Homebrew">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Git-000?logo=git&logoColor=F05032&style=flat-square" alt="Git Badge">
  <img src="https://img.shields.io/badge/Alacritty-000?logo=Alacritty&logoColor=F46D01&style=flat-square" alt="Alacritty Badge">
  <img src="https://img.shields.io/badge/Neovim-000?logo=neovim&logoColor=57A143&style=flat-square" alt="Neovim Badge">
  <img src="https://img.shields.io/badge/tmux-000?logo=tmux&logoColor=1BB91F&style=flat-square" alt="tmux Badge">
  <img src="https://img.shields.io/badge/npm-000?logo=npm&logoColor=CB3837&style=flat-square" alt="npm Badge">
  <img src="https://img.shields.io/badge/pnpm-000?logo=pnpm&logoColor=F69220&style=flat-square" alt="pnpm Badge">
  <img src="https://img.shields.io/badge/MySQL-000?logo=mysql&logoColor=4479A1&style=flat-square" alt="MySQL Badge">
  <img src="https://img.shields.io/badge/SQLite-000?logo=sqlite&logoColor=003B57&style=flat-square" alt="SQLite Badge">
  <img src="https://img.shields.io/badge/Visual_Studio_Code-000?logo=visualstudiocode&logoColor=007ACC&style=flat-square" alt="Visual Studio Code">
</p>


Install
---

Install all using the install.sh script

``` sh
$ git clone github.com/renchunhui/dotfiles $HOME/.config/dotfiles
$ chomd +x $HOME/.config/dotfiles/install.sh
$ ./install.sh
```

Install part using dot cli

``` sh
Usage: dot install [command]
Available Commands:
  brew      Homebrew 安装
  git       Git 环境
  alacritty 终端配置
  os        系统偏好设置
  neovim    NeoVim 配置
  node      Node 环境
  vscode    VSCode 开发环境
  zsh       zsh 环境
  help      帮助文档
```

Features
---

- Handy binary script
- Automatic software installation
- Sensible OS X defaults


Folder Structure
---

``` sh
├── bin
├── cmd
│   ├── install
│   └── uninstall
├── etc
│   ├── alacritty
│   ├── git
│   ├── npm
│   ├── tmux
│   └── zsh
├── user
│   ├── alacritty
│   ├── brew
│   ├── git
│   ├── neovim
│   ├── node
│   ├── os
│   ├── vscode
│   └── zsh
├── Brewfile
└── install.sh
```

License
---

[MIT License](./LICENSE)
