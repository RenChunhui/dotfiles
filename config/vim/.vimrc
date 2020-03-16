"
"                ╔═════════════════════════════════════════════╗
"                ║       ⎋ PERSONAL NEOVIM CONFIG FILE ⎋       ║
"                ╚═════════════════════════════════════════════╝
"
" Author    : Chunhui Ren
" Website   : https://renchunhui.github.io
" Repo      : https://github.com/renchunhui/dotfile

if empty(glob('~/.vim/plugged'))
  autocmd VimEnter * PlugInstall
endif

call early#init()
call plug#begin('~/.vim/plugged')

" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Statusline & tabline
Plug 'vim-airline/vim-airline'

" Theme
Plug 'morhetz/gruvbox'

" Format
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

" Others
Plug 'Yggdroot/LeaderF'
Plug 'hecal3/vim-leader-guide'

call plug#end()
