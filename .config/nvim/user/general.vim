" General Settings
"---------------------------------------------------------
" 基本 {{{
set number                   " 显示行号
set mouse=nv                 " Disable mouse in command-line mode
set fileformats=unix,dos,mac " Use Unix as the standard file type
}}}

" 缩进 {{{
" ----------------
set textwidth=80            " 文本宽度最大字符数
set noexpandtab             " Don't expand tabs to spaces.
set tabstop=2               " The number of spaces a tab is
set softtabstop=2           " While performing editing operations
set shiftwidth=2            " Number of spaces to use in auto(indent)
set smarttab                " Tab insert blanks according to 'shiftwidth'
set autoindent              " Use same indenting on new lines
set smartindent             " Smart autoindenting on new lines
set shiftround              " Round indent to multiple of 'shiftwidth'
" }}}

" 搜索 {{{
" ---------
set ignorecase              " Search ignoring case
set smartcase               " Keep case when searching with *
set infercase               " Adjust case in insert completion mode
set incsearch               " Incremental search
set hlsearch                " Highlight search results
set wrapscan                " Searches wrap around the end of the file
set showmatch               " Jump to matching bracket
set matchpairs+=<:>         " Add HTML brackets to pair matching
set matchtime=1             " Tenths of a second to show the matching paren
set cpoptions-=m            " showmatch will wait 0.5s or until a char is typed
" }}}

" 外观 {{{
" --------------------
set noshowmode              " Don't show mode in cmd window
set shortmess=aoOTI         " Shorten messages and don't show intro
set scrolloff=2             " Keep at least 2 lines above/below
set sidescrolloff=5         " Keep at least 5 lines left/right
set number                  " Show line numbers
set noruler                 " Disable default status ruler
set list                    " Show hidden characters

set showtabline=2           " Always show the tabs line
set winwidth=30             " Minimum width for active window
set winheight=1             " Minimum height for active window
set pumheight=15            " Pop-up menu's line height
set helpheight=12           " Minimum help window height
set previewheight=12        " Completion preview height

set noshowcmd               " Don't show command in status line
set cmdheight=2             " Height of the command line
set cmdwinheight=5          " Command-line lines
set noequalalways           " Don't resize windows on split or close
set laststatus=2            " Always show a status line
set colorcolumn=80          " Highlight the 80th character limit
set display=lastline
" }}}
