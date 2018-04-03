" 设置使用的框架
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1

" 控制 JSDoc 高亮
let g:javascript_plugin_jsdoc = 1

" 默认仅对.jsx启用语法高亮和缩进，设置其在 .js 文件中也使用
let g:jsx_ext_required = 0
