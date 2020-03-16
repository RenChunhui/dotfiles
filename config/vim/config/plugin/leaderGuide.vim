nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>

let g:lmap = {}

let g:lmap.1 = ['call feedkeys("\<Plug>BuffetSwitch(1)")','Tab1']
let g:lmap.2 = ['call feedkeys("\<Plug>BuffetSwitch(2)")','Tab2']

let g:lmap.b = {
  \'name' : 'Buffer',
  \'f' : ['LeaderfBuffer', 'Find Buffer'],
  \}

let g:lmap.f = {
      \'name' : 'File',
      \'f' : ['LeaderfFile', 'Find File'],
      \'e' : ['NERDTreeToggle', 'Explorer'],
      \}

let g:lmap.g = {
      \'name' : 'Git Menu',
      \'s' : ['Gstatus',  'Git Status'],
      \'p' : ['Gpull',    'Git Pull'],
      \'u' : ['Gpush',    'Git Push'],
      \'c' : ['Gcommit',  'Git Commit'],
      \'w' : ['Gwrite',   'Git Write']
      \}

let g:lmap.t = {
      \'name' : 'Toggle',
      \'e' : ['NERDTreeToggle', 'Explorer']
      \}

let g:lmap.h = {
      \ 'name' : 'Help',
      \ }

let g:lmap.w = {
      \ 'name' : 'Window'
      \ }

if !exists('leaderGuide#register_prefix_descriptions')
    call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
endif
