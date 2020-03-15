let NERDTreeShowHidden=1

let g:NERDTreeIgnore=['\~$', '\.git$[[dir]]','\.idea$[[dir]]', '\.sass-cache$','.DS_Store']

" This setting disables the 'Bookmarks' label 'Press ? for help' text.
let g:NERDTreeMinimalUI=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif