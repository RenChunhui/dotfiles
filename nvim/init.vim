"
"                ╔══════════════════════════════════════════╗
"                ║       ⎋ PERSONAL VIM CONFIG FILE ⎋       ║
"                ╚══════════════════════════════════════════╝
"
" Author    : Ren Chunhui
" Website   : https://renchunhui.github.io
" Repo      : https://github.com/renchunhui/dotfile

if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

" Plugins install ----------------------------------------- {{{
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('scrooloose/nerdtree')

call dein#add('ryanoasis/vim-devicons')

call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('vim-airline/vim-airline')
call dein#add('editorconfig/editorconfig-vim')

" HTML
call dein#add('othree/html5.vim',{'on_ft':'html'})
call dein#add('alvan/vim-closetag',{'on_ft':'html'})

" CSS
call dein#add('hail2u/vim-css3-syntax',{'on_ft':'css,scss,sass'})
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

" TypeScript
call dein#add('leafgarland/typescript-vim')
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('mhartington/nvim-typescript')
call dein#add('Quramy/tsuquyomi')

call dein#add('kien/ctrlp.vim')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
" }}}

" Basic settings ------------------------------------------ {{{
" General
set encoding=utf-8
set termguicolors
set autoread
set mouse=a

" Appearance
set ruler
set title
set number
set showmode
syntax enable
colorscheme base16-seti
set laststatus=2

" Tabs and Indents
set textwidth=80
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

" Search
set noignorecase

if has('nvim')
	let g:python2_host_prog = '/usr/local/bin/python'
	let g:python3_host_prog = '/usr/local/bin/python3'
endif
" }}}

" Omni completion ----------------------------------------- {{{
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" }}}

" Autocmd ------------------------------------------------- {{{
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0
" }}}


" HTML ---------------------------------------------------- {{{
" let g:neomake_html_enabled_makers = []
" let g: neoformat_enabled_html = ['htmlbeautify']
" }}}

" CSS ----------------------------------------------------- {{{

" }}}

" ECMAScript ---------------------------------------------- {{{
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
" }}}

" TypeScript ---------------------------------------------- {{{
let g:typescript_indent_disable = 1
autocmd FileType typescript :set makeprg=tsc
" }}}

" Plugin Configuration ------------------------------------ {{{

" Airline.vim {{{
augroup airline_config
  " 启用插件
  let g:airline#extensions#tabline#enabled = 1
augroup END
" }}}

" NERDTree {{{
augroup nerdtree_config
  map <C-n> :NERDTreeToggle<CR>
  " 自动打开目录
  autocmd vimenter * NERDTree
  " 显示隐藏文件
  let NERDTreeShowHidden=1
  " 屏蔽显示文件
  let NERDTreeIgnore = ['\.git$','\.svn$']
augroup END
" }}}

" Vim-Devicons {{{
augroup devicons_config
  set guifont=DroidSansMono_Nerd_Font:h11
  let g:airline_powerline_fonts = 1
  let g:NERDTreeGitStatusNodeColorization = 1
  let g:webdevicons_enable_denite = 1
  let g:WebDevIconsOS = 'Darwin'
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
augroup END
" }}}

" ctrlp {{{
augroup ctrlp_config
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|vscode)$'
  let g:ctrlp_custom_ignore = 'node_modules'
augroup END
"}}}

" deoplete {{{
augroup deoplete_config
  " 启用插件
  let g:deoplete#enable_at_startup = 1
augroup END
" }}}
" }}}
