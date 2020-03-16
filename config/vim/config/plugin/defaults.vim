set termguicolors
set mouse=a
set encoding=utf-8
set hidden

set showtabline=2
set laststatus=2
set number
set noruler

set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

try
  colorscheme gruvbox
catch
  colorscheme default
endtry

let mapleader = "\<Space>"