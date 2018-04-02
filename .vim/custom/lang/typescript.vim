let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

autocmd FileType typescript :set makeprg=tsc
