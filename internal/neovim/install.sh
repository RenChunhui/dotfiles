#!/bin/sh
#
# 安装配置 NeoVim

# 安装 Dependencies Build
brew deps neovim --include-build | xargs -n 1 brew install

# 安装 Dependencies Required
brew deps neovim --include-requirements | xargs -n 1 brew install

if test ! $(which nvim); then
  brew install neovim
fi

# 克隆 neovim 配置
if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
fi

# 安装 Language Server Protocol
cat $DOTPATH/config.json | jq ".lsp | .[]" | while read pkg
do
  check_pkg "npm install --g" $pkg
done

# 安装 Lua Language Server Protocol
if [[ ! -d "$HOME/.config/nvim/lua-language-server" ]]; then
  cd $HOME/.config/nvim
  git clone https://github.com/sumneko/lua-language-server
  cd lua-language-server
  git submodule update --init --recursive
  cd 3rd/luamake
  sh ./compile/install.sh
  cd ../..
  ./3rd/luamake/luamake rebuild
fi
