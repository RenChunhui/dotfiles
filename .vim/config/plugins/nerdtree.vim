" 自动打开目录
autocmd vimenter * NERDTree																						" 启动VIM自动打开目录

" 显示隐藏文件
let NERDTreeShowHidden=1

" 屏蔽显示文件
let NERDTreeIgnore = [
  \ '\.git$',
  \ '\.svn$',
  \ '.DS_Store'
  \ ]
