syntax enable                                                     " 开启语法高亮功能
syntax on                                                         " 允许用指定语法高亮配色方案替换默认方案

set mouse=a                                                       " 启用鼠标
set termguicolors
set encoding=utf-8                                                " 编码
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=DroidSansMono\ Nerd\ Font:h12
set shell=/bin/zsh                                                " 将shell设置为zsh
set textwidth=80                                                  " 文本宽度
set wildmenu                                                      " vim 自身命令行模式智能补全
set laststatus=2                                                  " 总是显示状态栏
set number                                                        " 开启行号显示
set tabstop=2 shiftwidth=2 expandtab
set relativenumber number																					" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has('nvim')
	let g:python2_host_prog = '/usr/local/bin/python'
	let g:python3_host_prog = '/usr/local/bin/python3'
endif

let g:airline_powerline_fonts = 1

" autocmd FileType html setlocal foldmethod=syntax
autocmd FileType html setlocal fdl=99

" autocmd FileType javascript call JavaScriptFold()
autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}
autocmd FileType coffee setl foldmethod=indent
