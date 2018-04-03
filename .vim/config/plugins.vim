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
Plug 'SirVer/ultisnips'

" HTML & CSS
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'alvan/vim-closetag', { 'for': 'html'}
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass'] }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax',{ 'for': ['sass','scss'] }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }                   " js语法高亮
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }           " javascript
Plug 'mxw/vim-jsx', { 'for': 'javascript' }                       " React.js
Plug 'othree/jsdoc-syntax.vim'

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


" 加载插件列表
function! SourceConfig()
	let path = '~/.vim/config/plugins'
	let file_list = split(globpath(path,'*.vim'),'\n')

	for file in file_list
		execute 'source' fnameescape(file)
	endfor
endfunction

call SourceConfig()
