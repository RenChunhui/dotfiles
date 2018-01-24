if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('joshdick/onedark.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('SirVer/ultisnips')

  " HTML5
  call dein#add('othree/html5.vim',{'on_ft':'html'})
  call dein#add('alvan/vim-closetag',{'on_ft':'html'})

  " CSS
  call dein#add('hail2u/vim-css3-syntax',{'on_ft':'css'})
  call dein#add('ap/vim-css-color',{'on_ft':'css,scss,sass'})
  call dein#add('cakebaker/scss-syntax.vim',{'on_ft':'scss,sass'})
  call dein#add('othree/csscomplete.vim',{'on_ft':'css'})

  " Javascript
  call dein#add('ternjs/tern_for_vim',{'build':'npm install'})
  call dein#add('carlitux/deoplete-ternjs',{'build':'npm install -g tern'})
  call dein#add('othree/yajs.vim')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('pangloss/vim-javascript',{'on_ft':'javascript,jsx,javascript.jsx'})

  " Typescript
  call dein#add('HerringtonDarkholme/yats.vim',{'on_ft':'typescript'})
  call dein#add('mhartington/nvim-typescript',{'on_ft':'typescript'})

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif
call dein#end()
