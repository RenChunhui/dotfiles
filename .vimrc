"
"     /)          /)       ,                  /) ,
"  _ (/      __  (/              _  _/_     _(/    ___
" (__/ )_(_(_/ (_/ )_(_(__(_ o  /_)_(__(_(_(_(__(_(_)
"
" @description: Vim 前端开发配置
" @author: Ren Chunhui
"
" Copyright (c) 2017 Ren Chunhui. All rights reserved.
"

if empty(glob('~/.dotfiles/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif

" 插件
source ~/.dotfiles/.vim/plugins.vim

" 常规设置
source ~/.dotfiles/.vim/settings.vim

" 快捷键
source ~/.dotfiles/.vim/keymap.vim
