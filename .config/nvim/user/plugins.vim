"                ╔══════════════════════════════════════════╗
"                ║            ⎋ PLUGINS MANAGER ⎋           ║
"                ╚══════════════════════════════════════════╝

if empty(glob('~/.vim/autoload/plug.vim'))
  silent curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" 基本插件
Plug 'scrooloose/nerdtree'                                        " 目录树
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'                                " git 插件
Plug 'kien/ctrlp.vim'                                             " 文件查找
Plug 'editorconfig/editorconfig-vim'                              " EditorConfig

" UI 外观
Plug 'vim-airline/vim-airline'                                    " 状态栏
Plug 'ryanoasis/vim-devicons'                                     " icons

Plug 'joshdick/onedark.vim'																				" one dark 主题

" HTML5
Plug 'othree/html5.vim'                                           " HTML5

" CSS
Plug 'cakebaker/scss-syntax.vim',{ 'for': 'scss'}                 " scss

" ECMAScript
Plug 'othree/yajs.vim', { 'for': 'javascript' }                   " js语法高亮
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }           " javascript
Plug 'othree/jsdoc-syntax.vim'                                    " JSDoc
Plug 'ternjs/tern_for_vim'                                        " TernJS
" ReactJS
Plug 'mxw/vim-jsx', { 'for': 'javascript' }                       " React.js

call plug#end()
