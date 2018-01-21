"
"                ╔══════════════════════════════════════════╗
"                ║       ⎋ PERSONAL VIM CONFIG FILE ⎋       ║
"                ╚══════════════════════════════════════════╝
"
" Author    : Ren Chunhui
" Website   : https://renchunhui.github.io
" Since     : 2018-01-18
" Repo      : https://github.com/renchunhui/dotfiles


function! Main()
	let path = '~/.config/nvim/user'
	let file_list = split(globpath(path,'*.vim'),'\n')

	for file in file_list
		execute 'source' fnameescape(file)
	endfor
endfunction

"call Main()

" load YAML config
function! LoadConfig()

python3 << EOF
import yaml,vim

config = open("./.config/nvim/config.yaml")
vim.vars['configData'] = yaml.load(config)
EOF

endfunction

exec LoadConfig()

