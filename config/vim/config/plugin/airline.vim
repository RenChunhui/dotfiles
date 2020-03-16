let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch','coc','tabline']
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#default#layout = [
      \ ['a', 'b'],
      \ ['x','y', 'error', 'warning']
      \ ]
let g:airline#extensions#tabline#formatter = 'unique_tail'
" enable coc integration.
let g:airline#extensions#coc#enabled = 1

" change error symbol.
let airline#extensions#coc#error_symbol = '✖ '

" change warning symbol.
let airline#extensions#coc#warning_symbol = '⚠ '

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '⓪ ',
        \ '1': '➊ ',
        \ '2': '❷ ',
        \ '3': '❸ ',
        \ '4': '❹ ',
        \ '5': '❺ ',
        \ '6': '❻ ',
        \ '7': '❼ ',
        \ '8': '❽ ',
        \ '9': '❾ '
        \}
