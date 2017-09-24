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



" 自动安装 {{{
" -----------------------------------------------------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
" }}}

" 插件安装 {{{
" -----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" 界面风格
" -------------------------------------
Plug 'vim-airline/vim-airline'                                    " 状态栏
Plug 'ryanoasis/vim-devicons'                                     " icons
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'mhartington/oceanic-next'

" 辅助功能
" -------------------------------------
Plug 'scrooloose/nerdtree'                                        " 目录树
Plug 'kien/ctrlp.vim'                                             " 文件查找
Plug 'Raimondi/delimitMate'                                       " 自动关闭括号
Plug 'editorconfig/editorconfig-vim'                              " EditorConfig

" 程序语言
" -------------------------------------
Plug 'othree/html5.vim'                                           " HTML5
Plug 'cakebaker/scss-syntax.vim',{ 'for': 'scss'}                 " scss
Plug 'othree/yajs.vim', { 'for': 'javascript' }                   " js语法高亮
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }   
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }           " javascript
Plug 'mxw/vim-jsx', { 'for': 'javascript' }                       " React.js
Plug 'othree/jsdoc-syntax.vim'                                    " JSDoc

" 自动补全
" -------------------------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/YouCompleteMe'                                     
Plug 'ternjs/tern_for_vim'

call plug#end()
" }}}



" 基础设置 {{{
" -----------------------------------------------------------------------------
syntax enable                                                     " 开启语法高亮功能
syntax on                                                         " 允许用指定语法高亮配色方案替换默认方案


set mouse=a                                                       " 启用鼠标
set termguicolors
set encoding=utf-8                                                " 编码
set guifont=<FONT_NAME>:h<FONT_SIZE>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h13
set shell=/bin/zsh                                                " 将shell设置为zsh
set textwidth=80                                                  " 文本宽度
set wildmenu                                                      " vim 自身命令行模式智能补全
set laststatus=2                                                  " 总是显示状态栏
set number                                                        " 开启行号显示

" 主题
" -------------------------------------
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme OceanicNext
" }}}



" 插件设置 {{{
" -----------------------------------------------------------------------------

" 插件启用
" -------------------------------------
let g:deoplete#enable_at_startup = 1
let g:webdevicons_enable = 1                                      " devicons
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" 界面风格
" -------------------------------------
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_nerdtree = 1                             " 添加到NerdTree
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_ctrlp = 1

" 辅助功能
" -------------------------------------

" 程序语言
" -------------------------------------
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1

let g:jsx_ext_required = 0                                        " react.js使用.js扩展名
let g:jsx_pragma_required = 1

au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-

" 自动补全
" -------------------------------------
let g:ycm_semantic_triggers =  {
  \   'javascript,typescript' : ['.'],
  \   'css': [ 're!^\s{4}', 're!:\s+' ],
  \ }

" }}}



" 快捷键设置 {{{
" -----------------------------------------------------------------------------
let mapleader=","                                                 " 定义快捷键前缀

nmap <Leader>fl :NERDTreeToggle<CR>                               " 打开目录树

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" }}}



" 代码折叠 {{{
" -----------------------------------------------------------------------------
autocmd FileType vim setlocal fdc=1
set foldlevel=99

autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

autocmd FileType javascript,typescript,json setl foldmethod=syntax
" }}}



" 代码片段 {{{
" -----------------------------------------------------------------------------

" }}}



" 自动补全 {{{
" -----------------------------------------------------------------------------

" omni complete
" ----------------------------------------
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" }}}