call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'

" AutoComplete
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }

" HTML & CSS
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass'] }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax',{ 'for': ['sass','scss'] }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Vim
Plug 'syngan/vim-vimlint', { 'for': 'vim' }
Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }

" Tmux
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'edkolev/tmuxline.vim', { 'for': 'tmux' }

call plug#end()

filetype plugin indent on


" Plugin settings --------------------------------------------------------- {{{
" NERDTree {{{
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
" }}}

" TypeScript {{{
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

autocmd FileType typescript :set makeprg=tsc
" }}}

" Tmux {{{
" tmux 主题
let g:tmuxline_theme = 'airline'
let g:airline#extensions#tmuxline#enabled = 0
" 不显示符号
let g:tmuxline_powerline_separators = 0
" }}}
" }}}
