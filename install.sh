echo ""
echo " ---------------------------------------------- "
echo "|              /)          /)       ,          |"
echo "|             (/      __  (/                   |"
echo "|          (__/ )_(_(_/ (_/ )_(_(__(_          |"
echo "|                                              |"
echo "|                Web 前端开发配置                |"
echo "|                                              |"
echo "| Author: Ren Chunhui                          |"
echo "| repo  : https://github.com/renchunhui        |"
echo "| E-mail: renchunhui2008@gmail.com             |"
echo " ---------------------------------------------- "
echo ""

# 安装 oh-my-zsh
install_zsh() {
    if [ ! -d "~/.oh-my-zsh" ]
    then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi
}

# brew 安装包
install_brew() {
    brew install tmux
    brew install neovim
    brew install CMake
}

# 软链接
dotfiles_link() {
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/.config ~/.config
    ln -s ~/.dotfiles/.tmux ~/.tmux
    ln -s ~/.dotfiles/.tern-config ~/.tern-config
}

install_zsh
install_brew
dotfiles_link

