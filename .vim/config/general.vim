" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set nocompatible                    " 关闭 vi 兼容模式
set noshowmatch                     " 括号匹配
set cursorline                      " 高亮当前行
set shell=/bin/zsh                  " 将shell设置为zsh
set wildmenu                        " vim 自身命令行模式智能补全

" General
set encoding=utf-8                  " 编码
set termguicolors
set autoread                        " 文件修改后自动载入
set mouse=a                         " 启用鼠标

" Appearance
set ruler                           " 显示光标位置
set title
set number                          " 显示行号
set showmode
syntax enable
colorscheme onedark                 " 主题

" Tabs and Indents
set textwidth=80
set tabstop=2
set shiftwidth=2
set expandtab
set showtabline=2                   " 显示标签栏
set laststatus=2                    " 显示状态栏

" Search
set noignorecase
set hlsearch                        " 高亮search命中的文本
