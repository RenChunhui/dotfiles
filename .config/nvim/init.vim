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
let config_path = expand('~/.config/nvim/config.yaml')

python3 << EOF
import yaml,vim

config = open(vim.eval("config_path"))
vim.vars['configData'] = yaml.load(config)
EOF

endfunction

" 常规设置
function! AutoGeneral()
  for item in g:configData["General"]
    execute "set" item
  endfor
endfunction

" 插件安装
function! AutoPlugins()
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.config/nvim/plugged')

  for item in g:configData["Plugins"]
    if has_key(item,'options')
      execute "Plug '" . item['repo'] . "', { " . item['options'] . " }"
    else
      execute "Plug '" . item['repo'] . "'"
    endif
  endfor

  call plug#end()
endfunction

call LoadYAML()
call AutoGeneral()
call AutoPlugins()
