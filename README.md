<div align="center">
  <img src="https://s1.ax1x.com/2020/04/04/G0HZUs.png">
  <p>使用自定义命令行管理你的 macOS</p>
</div>

<p align="center">
  <a href=""><img src="https://img.shields.io/badge/-macOS-000000?style=flat-square&logo=Apple&logoColor=white" alt="macOS"></a>
  <a href=""><img src="https://img.shields.io/badge/-Homebrew-FBB040?style=flat-square&logo=Homebrew&logoColor=black" alt="Homebrew"></a>
</p>

<p align="center">
  <a href="https://github.com/RenChunhui/"><img alt="GitHub top language" src="https://img.shields.io/github/languages/top/renchunhui/dotfiles.svg"></a>
  <a href="https://github.com/RenChunhui/"><img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/renchunhui/dotfiles"></a>
  <a href="./LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/renchunhui/dotfiles"></a>
</p>


特性
---

网上有许多 `dotfiles`，但都极度私有化，基本只能参考一下人家配置和学习代码写法。但整体理解下来功能与实现情况如下：

- [x] 实现软件和命令行工具的安装(如 macOS 的 brew，Linux 的 pacman apt dnf 等)
- [x] 配置文件的备份(软链接、复制、Git 克隆之类的方式)
- [-] 封装定义一些效率脚本


安装
---

``` sh
$ git clone https://github.com/renchunhui/dotfiles ~/.config/dotfiles
$ cd $HOME/.config/dotfiles
$ chmod +x ./install.sh
$ ./install.sh
```

如何配置
---

- **pkgs:** 安装包

  - **summary:** 描述
  - **install:** 执行的命令
  - **list:** 列表

    - **name:** 包名
    - **summary:** 描述
- **porter:** 搬运

  - **summary:** 描述
  - **list:** 列表

    - **type:** 命令类型
    - **from:** 从什么位置
    - **to:** 到什么位置


版权协议
---

[MIT License](./LICENSE)
