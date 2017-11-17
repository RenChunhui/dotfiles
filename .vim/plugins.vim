call plug#begin('~/.dotfiles/.vim/plugged')

" 界面风格
" -------------------------------------
Plug 'vim-airline/vim-airline'                                    " 状态栏
Plug 'ryanoasis/vim-devicons'                                     " icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'joshdick/onedark.vim'																				" one dark 主题
Plug 'sheerun/vim-polyglot'																				" 加强语法高亮


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

" 辅助功能
" -------------------------------------
Plug 'scrooloose/nerdtree'                                        " 目录树
Plug 'Xuyuanp/nerdtree-git-plugin'                                " git 插件
Plug 'kien/ctrlp.vim'                                             " 文件查找
Plug 'editorconfig/editorconfig-vim'                              " EditorConfig

" 自动补全
" -------------------------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'

call plug#end()



" joshdick/onedark.vim
" -------------------------------------

" 设置状态栏主题
let g:airline_theme='onedark'
" 加强注释效果
let g:onedark_terminal_italics=1

" NERDTree
" -------------------------------------
autocmd vimenter * NERDTree																						" 启动VIM自动打开目录
