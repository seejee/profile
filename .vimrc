let mapleader = ","

nnoremap ' `
nnoremap ` '

syntax on
filetype on
filetype plugin on
filetype indent on

set hlsearch
set hidden
set incsearch
set history=1000

set wildmode=list:longest
set title
set scrolloff=3
set ruler
set backspace=indent,eol,start

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

runtime macros/matchit.vim

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

