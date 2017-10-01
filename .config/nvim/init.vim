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
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'mhartington/oceanic-next'

" 辅助功能
" -------------------------------------
Plug 'scrooloose/nerdtree'                                        " 目录树
Plug 'Xuyuanp/nerdtree-git-plugin'                                " git 插件
Plug 'kien/ctrlp.vim'                                             " 文件查找
Plug 'Raimondi/delimitMate'                                       " 自动关闭括号
Plug 'editorconfig/editorconfig-vim'                              " EditorConfig
Plug 'rizzatti/dash.vim'                                          " Dash API
"Plug 'Yggdroot/indentLine'
Plug 'moll/vim-node'

" 程序语言
" -------------------------------------
Plug 'othree/html5.vim'                                           " HTML5
Plug 'alvan/vim-closetag', { 'for': 'html'}                       " 自动关闭标签
Plug 'cakebaker/scss-syntax.vim',{ 'for': 'scss'}                 " scss
Plug 'othree/yajs.vim', { 'for': 'javascript' }                   " js语法高亮
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }           " javascript
Plug 'mxw/vim-jsx', { 'for': 'javascript' }                       " React.js
Plug 'othree/jsdoc-syntax.vim'                                    " JSDoc
Plug 'posva/vim-vue'                                              " Vue

" 自动补全
" -------------------------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'

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
set ts=4

set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L

" 主题
" -------------------------------------
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme OceanicNext
" }}}



" 插件设置 {{{
" -----------------------------------------------------------------------------

" 界面风格
" -------------------------------------

" ariline
let g:airline#extensions#tabline#enabled = 0                      " 禁用标签行

" devicons
let g:webdevicons_enable = 1                                      " 启用插件
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_nerdtree = 1                             " 添加到NerdTree
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:airline_powerline_fonts = 1
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''

" oceanicnext 主题
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" 辅助功能
" -------------------------------------

" NERDTree
autocmd vimenter * NERDTree                                       " 自动打开目录树
let NERDTreeShowHidden = 1                                        " 是否显示隐藏文件
let NERDTreeIgnore=['\.pyc','\.DS_Store','\.swp']                 " 忽略一下文件的显示
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ctrlp
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vscode|idea)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" editorconfig
"let g:EditorConfig_exec_path = './../../.editorconfig'

" closetag
let g:closetag_filenames = '*.html'

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" 程序语言
" -------------------------------------

" Javascript
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1

" Vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.scss
let g:vue_disable_pre_processors=1

" React.js
let g:jsx_ext_required = 0                                        " react.js使用.js扩展名
let g:jsx_pragma_required = 1

au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-

" 自动补全
" -------------------------------------

" deoplete
let g:deoplete#enable_at_startup = 1                              " 插件启用

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
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
