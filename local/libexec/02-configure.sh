#!/bin/sh

log group "Terminal Configuration"

# 安装 Oh My Zsh
if [ ! -d "$ZDOTDIR/ohmyzsh" ]; then
  gclone https://github.com/ohmyzsh/ohmyzsh.git $ZDOTDIR/ohmyzsh

  gclone https://github.com/zsh-users/zsh-autosuggestions.git $ZDOTDIR/ohmyzsh/custom/plugins/zsh-autosuggestions

  gclone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZDOTDIR/ohmyzsh/custom/plugins/zsh-syntax-highlighting

  gclone https://github.com/zsh-users/zsh-completions $ZDOTDIR/ohmyzsh/custom/plugins/zsh-completions
else
  log ok "$(printf '%-30s' ohmyzsh) ${GRAY}linked${RESET}"
fi

# zshrc
rm -rf $ZDOTDIR/.zshrc
cp etc/zsh/zshrc $ZDOTDIR/.zshrc
zsh $ZDOTDIR/.zshrc
log ok "$(printf '%-30s' zshrc) ${GRAY}linked${RESET}"

# Ghostty
rm -rf $XDG_CONFIG_HOME/ghostty
ln -s $DOTFILES_HOME/etc/ghostty $XDG_CONFIG_HOME/ghostty
log ok "$(printf '%-30s' ghostty) ${GRAY}linked${RESET}"

# Git
rm -rf $XDG_CONFIG_HOME/git
mkdir $XDG_CONFIG_HOME/git
ln -s $DOTFILES_HOME/etc/git/attributes $XDG_CONFIG_HOME/git/attributes
ln -s $DOTFILES_HOME/etc/git/ignore $XDG_CONFIG_HOME/git/ignore
ln -s $DOTFILES_HOME/etc/git/message $XDG_CONFIG_HOME/git/message
cp $DOTFILES_HOME/etc/git/config $XDG_CONFIG_HOME/git/config
sed -i '' "s/__GIT_USER_NAME__/${GIT_USER_NAME}/g" $XDG_CONFIG_HOME/git/config
sed -i '' "s/__GIT_USER_EMAIL__/${GIT_USER_EMAIL}/g" $XDG_CONFIG_HOME/git/config
log ok "$(printf '%-30s' git) ${GRAY}linked${RESET}"

# npm
rm -rf $XDG_CONFIG_HOME/npm
ln -s $DOTFILES_HOME/etc/npm $XDG_CONFIG_HOME/npm
log ok "$(printf '%-30s' npm) ${GRAY}linked${RESET}"

# Neovim
if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
  gclone https://github.com/renchunhui/nvim $XDG_CONFIG_HOME/nvim
else
  log ok "$(printf '%-30s' neovim) ${GRAY}installed${RESET}"
fi

# Synology
rm -rf $XDG_CONFIG_HOME/synology
ln -s $DOTFILES_HOME/etc/synology $XDG_CONFIG_HOME/synology
log ok "$(printf '%-30s' synology) ${GRAY}linked${RESET}"

# Tmux
rm -rf $XDG_CONFIG_HOME/tmux
mkdir $XDG_CONFIG_HOME/tmux
ln -snf $DOTFILES_HOME/etc/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
log ok --last "$(printf '%-30s' tmux) ${GRAY}linked${RESET}"
