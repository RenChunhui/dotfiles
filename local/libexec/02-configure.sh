#!/bin/sh

log group "Terminal Configuration"

# 安装 Oh My Zsh
git_clone_safe https://github.com/ohmyzsh/ohmyzsh.git $ZDOTDIR/ohmyzsh
git_clone_safe https://github.com/zsh-users/zsh-autosuggestions.git $ZDOTDIR/ohmyzsh/custom/plugins/zsh-autosuggestions
git_clone_safe https://github.com/zsh-users/zsh-syntax-highlighting.git $ZDOTDIR/ohmyzsh/custom/plugins/zsh-syntax-highlighting
git_clone_safe https://github.com/zsh-users/zsh-completions $ZDOTDIR/ohmyzsh/custom/plugins/zsh-completions

# zshrc
rm -rf $ZDOTDIR/.zshrc
cp etc/zsh/zshrc $ZDOTDIR/.zshrc
zsh $ZDOTDIR/.zshrc
log ok "$(printf '%-30s' zshrc) ${GRAY}[COPYED]${RESET}"

# Ghostty
ln_safe $DOTFILES_HOME/etc/ghostty $XDG_CONFIG_HOME/ghostty

# Git
rm -rf $XDG_CONFIG_HOME/git
mkdir $XDG_CONFIG_HOME/git
ln_safe $DOTFILES_HOME/etc/git/attributes $XDG_CONFIG_HOME/git/attributes
ln_safe $DOTFILES_HOME/etc/git/ignore $XDG_CONFIG_HOME/git/ignore
ln_safe $DOTFILES_HOME/etc/git/message $XDG_CONFIG_HOME/git/message
cp $DOTFILES_HOME/etc/git/config $XDG_CONFIG_HOME/git/config
sed -i '' "s/__GIT_USER_NAME__/${GIT_USER_NAME}/g" $XDG_CONFIG_HOME/git/config
sed -i '' "s/__GIT_USER_EMAIL__/${GIT_USER_EMAIL}/g" $XDG_CONFIG_HOME/git/config
log ok "$(printf '%-30s' git) ${GRAY}[LINKED]${RESET}"

# npm
ln_safe $DOTFILES_HOME/etc/npm $XDG_CONFIG_HOME/npm

# Neovim
git_clone_safe https://github.com/RenChunhui/nvim.git $XDG_CONFIG_HOME/nvim

# Synology
ln_safe $DOTFILES_HOME/etc/synology $XDG_CONFIG_HOME/synology

# Tmux
rm -rf $XDG_CONFIG_HOME/tmux
chmod +x $DOTFILES_HOME/etc/tmux/scripts/status-left.sh
chmod +x $DOTFILES_HOME/etc/tmux/scripts/status-right.sh
ln -sfn $DOTFILES_HOME/etc/tmux $XDG_CONFIG_HOME/tmux
log ok "$(printf '%-30s' tmux) ${GRAY}[LINKED]${RESET}"
