" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" General
set encoding=utf-8
set termguicolors
set autoread
set mouse=a

" Appearance
set ruler
set title
set number
set showmode
syntax enable
colorscheme onedark

" Tabs and Indents
set textwidth=80
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2

" Search
set noignorecase
