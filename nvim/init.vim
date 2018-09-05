"
"                ╔══════════════════════════════════════════╗
"                ║       ⎋ PERSONAL VIM CONFIG FILE ⎋       ║
"                ╚══════════════════════════════════════════╝
"
" Author    : Ren Chunhui
" Website   : https://renchunhui.github.io
" Repo      : https://github.com/renchunhui/dotfiles


" Plugins Install {{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('scrooloose/nerdtree')
call dein#add('joshdick/onedark.vim')

" HTML5
call dein#add('othree/html5.vim',{'on_ft':'html'})
call dein#add('alvan/vim-closetag',{'on_ft':'html'})

" CSS
call dein#add('hail2u/vim-css3-syntax',{'on_ft':'css'})
call dein#add('ap/vim-css-color',{'on_ft':'css,scss,sass'})
call dein#add('cakebaker/scss-syntax.vim',{'on_ft':'scss,sass'})
call dein#add('othree/csscomplete.vim',{'on_ft':'css'})

" Javascript
call dein#add('ternjs/tern_for_vim',{'build':'npm install'})
call dein#add('carlitux/deoplete-ternjs',{'build':'npm install -g tern'})
call dein#add('othree/yajs.vim')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('pangloss/vim-javascript',{'on_ft':'javascript,jsx,javascript.jsx'})
call dein#add('othree/jspc.vim')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif
call dein#end()

filetype plugin indent on
syntax enable
" }}}

" Options Setting {{{
" General
set encoding=utf-8
set termguicolors
set mouse=a
filetype on

" Tabs and Indents
set textwidth=80
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set showcmd

" Appearance
set number
set ruler
set showtabline=2         " 显示状态栏

" Search
set noignorecase          " 区分大小写

" Wildmenu
if has('wildmenu')
  set wildignore+=.git,.svn,.vscode,.idea
  set wildignore+=**/node_modules/**,*/.sass-cache/*
endif

set completeopt=menu
" }}}

" omni funcs {{{
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
  \]
" }}}

" Plugin Settings {{{
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_refresh_delay = 0
let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
call deoplete#enable_logging('DEBUG', '/PATH_TO/deoplete.log')

" NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$','\.svn$','\.DS_Store']

" HTML
let g:closetag_filenames = '*.html'
let g:closetag_xhtml_filenames = '*.jsx'


" JavaScript
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1

" theme
colorscheme onedark
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:onedark_terminal_italics=1
" }}}

