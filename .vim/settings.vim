syntax enable                                                     " 开启语法高亮功能
syntax on                                                         " 允许用指定语法高亮配色方案替换默认方案

set mouse=a                                                       " 启用鼠标
set termguicolors
set encoding=utf-8                                                " 编码
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h12
set shell=/bin/zsh                                                " 将shell设置为zsh
set textwidth=80                                                  " 文本宽度
set wildmenu                                                      " vim 自身命令行模式智能补全
set laststatus=2                                                  " 总是显示状态栏
set number                                                        " 开启行号显示
set ts=4

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
