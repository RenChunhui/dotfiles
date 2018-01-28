"
"                ╔══════════════════════════════════════════╗
"                ║       ⎋ FLEXIBLE VIM CONFIG FILE ⎋       ║
"                ╚══════════════════════════════════════════╝
"
" Author    : Ren Chunhui
" Website   : https://renchunhui.github.io
" Since     : 2018-01-24
" Repo      : https://github.com/renchunhui/dotfiles

" 加载插件列表
function! LoadConfig()
	let path = '~/.vim/plugins'
	let file_list = split(globpath(path,'*.vim'),'\n')

	for file in file_list
		execute 'source' fnameescape(file)
	endfor
endfunction

" 插件
source $HOME/.vim/plugins.vim

" 属性
source $HOME/.vim/options.vim

call LoadConfig()
