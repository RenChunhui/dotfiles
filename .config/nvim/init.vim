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
	let path = '~/.config/nvim/plugins'
	let file_list = split(globpath(path,'*.vim'),'\n')

	for file in file_list
		execute 'source' fnameescape(file)
	endfor
endfunction

" 插件
source $HOME/.config/nvim/plugins.vim

" 常规设置
source $HOME/.config/nvim/general.vim

call LoadConfig()
