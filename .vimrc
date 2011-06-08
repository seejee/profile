set hidden 
nnoremap ' `
nnoremap ` '
let mapleader = ","

set history=1000

runtime macros/matchit.vim

set wildmode=list:longest
set title
set scrolloff=3
set ruler

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set backspace=indent,eol,start
 
syntax on
filetype on
filetype plugin on
filetype indent on
 
set hlsearch
set incsearch 

