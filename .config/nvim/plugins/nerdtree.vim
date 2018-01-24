" 自动打开目录
autocmd vimenter * NERDTree																						" 启动VIM自动打开目录

" 显示隐藏文件
let NERDTreeShowHidden=1

" 屏蔽显示文件
let NERDTreeIgnore = [
  \   '\.git$','\.svn$','\.vscode$','\.idea$',
  \  '\.DS_Store$', '\.sass-cache$'
  \ ]

" 自定义 git 符号
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
