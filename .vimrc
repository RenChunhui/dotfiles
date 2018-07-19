"
"     /)          /)       ,                  /) ,
"  _ (/      __  (/              _  _/_     _(/    ___
" (__/ )_(_(_/ (_/ )_(_(__(_ o  /_)_(__(_(_(_(__(_(_)
"
" @description: Vim config
" @author: Ren Chunhui
"
" Copyright (c) 2017 Ren Chunhui. All rights reserved.
"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" let g:mapleader = "\<Space>"

" source ~/.vim/core/plugins.vim

" Enable loading {ftdetect,ftplugin,indent}/*.vim files.
filetype plugin indent on

" Enable loading syntax/*.vim files.
syntax on

" Set leader keys.
let g:mapleader = "\<Space>"
