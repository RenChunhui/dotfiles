if (g:enable_popup == 1)
    let g:Lf_WindowPosition = 'popup'
else
    let g:Lf_WindowPosition = 'bottom'
endif

let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

" 过滤文件和目录
let g:Lf_WildIgnore = {
            \ 'dir': ['node_modules','.git'],
            \ 'file': []
            \}

" 启用配置状态栏的配色功能
let g:Lf_StlColorscheme = 'powerline'

" 分隔符
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }

" 弹出位置
let g:Lf_PopupPosition = [2,0]

" 不显示状态行
let g:Lf_PopupShowStatusline = 0
