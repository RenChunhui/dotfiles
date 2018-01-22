"
"                ╔══════════════════════════════════════════╗
"                ║       ⎋ PERSONAL VIM CONFIG FILE ⎋       ║
"                ╚══════════════════════════════════════════╝
"
" Author    : Ren Chunhui
" Website   : https://renchunhui.github.io
" Since     : 2018-01-18
" Repo      : https://github.com/renchunhui/dotfiles

" YAML 配置
function! LoadYAML()

python3 << EOF
import yaml,vim

config = open("./.config/nvim/config.yaml")
vim.vars['configData'] = yaml.load(config)
EOF

endfunction

function! LoadConfig()
	let path = '~/.config/nvim/user'
	let file_list = split(globpath(path,'*.vim'),'\n')

	for file in file_list
		execute 'source' fnameescape(file)
	endfor
endfunction

" 常规设置
function! AutoGeneral()
  for item in g:configData["General"]
    execute "set" item
  endfor
endfunction

" 插件安装
function! AutoPlugins()
  if empty(glob('~/.config/autoload/plug.vim'))
    silent curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.config/nvim/plugged')
  call plug#end()
endfunction

call LoadYAML()
call AutoGeneral()
