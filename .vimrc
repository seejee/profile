let mapleader = ","
let maplocalleader = "\\"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'daveray/vimclojure-easy' , {'rtp': 'bundle/vimclojure-2.3.5'}
Bundle 'VimClojure'
Bundle 'paredit.vim'

filetype plugin indent on

nnoremap ' `
nnoremap ` '

syntax on
filetype on
filetype plugin on
filetype indent on

let g:paredit_mode = 1
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
let vimclojure#SplitPos = "bottom"
:helptags ~/.vim/bundle/VimClojure/doc/

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

set textwidth=78
set hls

set number
set wildmode=list:longest
set title
set scrolloff=3
set ruler
set backspace=indent,eol,start

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

map Y y$

" reload .vimrc when it is save
au BufWritePost .vimrc so ~/.vimrc

runtime macros/matchit.vim

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" better split nav
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"quickly jump between two windows
map <leader>p <C-w>p  
map <leader>w <C-w>p  

" use jk as ESC in insert mode
inoremap jk <Esc>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

colorscheme solarized
set background=dark

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
set winheight=5
set winminheight=5
set winheight=999

" leave visual mode enabled when indenting blocks
vmap > >gv
vmap < <gv

" Window swapping
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

" Testy McTestertons
function! IsMinitest(filename)
  echo a:filename
  return match(a:filename, '_test.rb$') != -1
endfunction

function! IsRspec(filename)
  return match(a:filename, '_spec.rb$') != -1
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo

    if IsMinitest(a:filename)
      let command_to_run = ":!ruby " . a:filename
    elseif IsRspec(a:filename)
      let command_to_run = ":!rspec " . a:filename
    end

    exec command_to_run
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = IsMinitest(expand("%")) || IsRspec(expand("%"))
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('spec')<cr>   
