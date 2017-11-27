call plug#begin('~/.dotfiles/.vim/plugged')

Plug 'vim-airline/vim-airline'                                    " 状态栏
Plug 'ryanoasis/vim-devicons'                                     " icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'joshdick/onedark.vim'																				" one dark 主题
Plug 'sheerun/vim-polyglot'																				" 加强语法高亮

Plug 'othree/html5.vim'                                           " HTML5
Plug 'alvan/vim-closetag', { 'for': 'html'}                       " 自动关闭标签
Plug 'cakebaker/scss-syntax.vim',{ 'for': 'scss'}                 " scss
Plug 'othree/yajs.vim', { 'for': 'javascript' }                   " js语法高亮
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }           " javascript
Plug 'mxw/vim-jsx', { 'for': 'javascript' }                       " React.js
Plug 'othree/jsdoc-syntax.vim'                                    " JSDoc

Plug 'scrooloose/nerdtree'                                        " 目录树
Plug 'Xuyuanp/nerdtree-git-plugin'                                " git 插件
Plug 'kien/ctrlp.vim'                                             " 文件查找
Plug 'editorconfig/editorconfig-vim'                              " EditorConfig

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'

call plug#end()



" 加载插件列表
function! SourceConfig()
	let path = '~/.vim/plugins'
	let file_list = split(globpath(path,'*.vim'),'\n')

	for file in file_list
		execute 'source' fnameescape(file)
	endfor
endfunction

call SourceConfig()
