<div align="center">
  <svg width="128px" height="128px" viewBox="0 0 152 152" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <rect x="0" y="0" width="152" height="152"></rect>
          <path d="M80,12 C115.346224,12 144,40.653776 144,76 C144,111.346224 115.346224,140 80,140 C69.476247,140 59.5457475,137.45998 50.7881188,132.959558 L50.4901529,134.071206 C49.5527786,137.568352 46.3835154,140 42.7629214,140 L24.054,140 L24.054,140 L45.7263757,59.1208417 C47.4416774,52.7192485 54.0217209,48.9202586 60.4233142,50.6355603 C66.8249074,52.3508621 70.6238973,58.9309056 68.9085955,65.3324988 L57.2357623,108.894956 C63.6971669,113.374879 71.5420186,116 80,116 C102.09139,116 120,98.09139 120,76 C120,53.90861 102.09139,36 80,36 L21.7660738,36 C18.3226305,36 15.2655197,33.7965592 14.1766074,30.5298221 L8,12 L8,12 L80,12 Z" fill="currentColor"></path>
          <circle fill="currentColor" cx="92" cy="76" r="12"></circle>
      </g>
  </svg>
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
