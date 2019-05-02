let mapleader = ","
let maplocalleader = ","
set nocompatible
filetype off

call plug#begin()

Plug 'gmarik/vundle'
Plug 'mileszs/ack.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'thalesmello/tabfold'
Plug 'jreybert/vimagit'
Plug 'godlygeek/tabular'
Plug 'wojtekmach/vim-rename'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benmills/vimux'
Plug 'kien/rainbow_parentheses.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-unimpaired'
Plug 'dkprice/vim-easygrep'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'plasticboy/vim-markdown'

Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

filetype plugin indent on

nnoremap ' `
nnoremap ` '

syntax on
filetype on
filetype plugin on
filetype indent on

command! WQ wq
command! Wq wq
command! W w
command! Q w

let g:paredit_mode = 1

set hlsearch
set hidden
set incsearch
set history=1000

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch

set textwidth=120
set hls

set number
set wildmode=list:longest
set title
set scrolloff=3
set ruler
set backspace=indent,eol,start
set clipboard=unnamed

set backupdir=~/.vim-tmpAligntmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

nmap \x :cclose<CR>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

" You don't know what you're missing if you don't use this.
nmap <C-e> :e#<CR>

" Move between open buffers.
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

map Y y$

" reload .vimrc when it is save
au BufWritePost .vimrc so ~/.vimrc
au BufRead,BufNewFile *.ctl set filetype=ruby
au BufRead,BufNewFile *.ctl set syntax=ruby
au BufRead,BufNewFile *.ebf set filetype=ruby
au BufRead,BufNewFile *.ebf set syntax=ruby
autocmd BufRead,BufNewFile *.slimbars setlocal filetype=slim

" Turn on spell check for certain file types
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us
set complete+=kspell

runtime macros/matchit.vim

" completion

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --ignore=*.svg,*.png -l -g ""'
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>

nmap <leader>f mo:Ack! "\b<cword>\b" <CR>

set tags=./tags,tags,coffee.tags

let g:EclimCompletionMethod = 'omnifunc'

" ALE
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\}

let g:ale_fix_on_save = 1

" better split nav
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"quickly jump between two windows
map <leader>p <C-w>p
map <leader>w <C-w>p

" YankStack bindings
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" use jk as ESC in insert mode inoremap jk <Esc>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
map <leader>j <Esc>:%!json_xs -f json -t json-pretty<CR>

" color scheme
" let g:solarized_termcolors=256
let g:solarized_termtrans = 1 " This gets rid of the grey background
set background=dark
colorscheme solarized

" use return to clear hl search
:nnoremap <CR> :nohlsearch<CR>/<BS>

" quickly move between previous buffer
nnoremap <leader><leader> <c-^>

" edit files in the same directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" leave current window big, but leave others for context
set winwidth=100
" We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.
set winheight=15
set winminheight=15
set winheight=999

" leave visual mode enabled when indenting blocks
vmap > >gv
vmap < <gv

let g:vim_markdown_folding_disabled = 1

" Show trailing spaces as a dot
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Catch trailing whitespace
set list listchars=trail:.,tab:>>

nmap <silent> <leader><space> :call TrimSpaces()<CR>

function! TrimSpaces()
    %s/\s*$//
    %s/\t/  /g
    ''
endfunction

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
