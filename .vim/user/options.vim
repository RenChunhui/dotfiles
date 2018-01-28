" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
set termguicolors

" 禁用鼠标
set mouse=a
" 编码
set encoding=utf-8
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=DroidSansMono\ Nerd\ Font:h12
" 将shell设置为zsh
set shell=/bin/zsh
" 文本宽度
set textwidth=80
" vim 自身命令行模式智能补全
set wildmenu
" 总是显示状态栏
set laststatus=2
" 开启行号显示
set number
set numberwidth=1
" 设置tab键的宽度
set tabstop=2
" 换行时行间交错使用2个空格
set shiftwidth=2
set expandtab
" 自动对齐
set autoindent
" 显示括号配对情况
set showmatch
" 右下角显示光标位置的状态行
set ruler
" 显示未完成的命令
set showcmd

" 查找book时，当输入/b时会自动找到
set incsearch
" 开启高亮显示结果
set hlsearch
" 开启实时搜索功能
set incsearch
" 搜索到文件两端时不重新搜索
set nowrapscan
" 区分大小写
set ignorecase

" 设置不自动换行
set nowrap
" 显示标签栏, 0 为隐藏
set showtabline=2
set list

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L

" macOS 使用平滑反锯齿的字体
set autochdir

if has('nvim')
	let g:python2_host_prog = '/usr/local/bin/python'
	let g:python3_host_prog = '/usr/local/bin/python3'
endif

" 主题设置
colorscheme onedark

" Omni completion
filetype plugin on
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
