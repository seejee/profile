runtime macros/matchit.vim

let mapleader = ","
let maplocalleader = "\\"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'wojtekmach/vim-rename'
Plugin 'airblade/vim-gitgutter'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'benmills/vimux'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'dkprice/vim-easygrep'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'

Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
Plugin 'paredit.vim'

Plugin 'SQLUtilities'
Plugin 'Align'
Plugin 'vim-scripts/AnsiEsc.vim'

Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'elixir-lang/vim-elixir'

Plugin 'ElmCast/elm-vim'

Plugin 'jnwhiteh/vim-golang'

Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'

Plugin 'mxw/vim-jsx'

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

let g:EclimCompletionMethod = 'omnifunc'

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

" Clojure bindings
nmap <leader>; :%Eval<CR>
nmap <leader>: :Eval<CR>

" Elm bindings
au FileType elm nmap <leader>b <Plug>(elm-make)
au FileType elm nmap <leader>m <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)

" regenerate ctags
"map <Leader>c :!rm tags; ctags --extra=+f -R *<CR><CR>
set tags=./tags,tags,coffee.tags
map <Leader>c :!rm tags; ctags --extra=+f --exclude=coverage --exclude=.git --exclude=vendor --exclude=log --exclude=node_modules --exclude=public -R *;rm coffee.tags; coffeetags -R -f coffee.tags<CR><CR>
autocmd FileType ruby map <Leader>s :w<CR>:!ruby -c %<CR>
" use jk as ESC in insert mode inoremap jk <Esc>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
map <leader>j <Esc>:%!json_xs -f json -t json-pretty<CR>

" color scheme
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
set winheight=15
set winminheight=15
set winheight=999

" leave visual mode enabled when indenting blocks
vmap > >gv
vmap < <gv

" Ctrl-p excludes
set wildignore+=*.png,*.jpg,*.pdf,*.swf,spec/etl/apangea/**,log/**,tmp/**,temp/**
let g:ctrlp_custom_ignore = '\.git$\|\.o$\|\.app$\|\.beam$\|\.dSYM\|\.ipa$\|\.csv\|tags\|public\/images$\|public\/uploads$\|log\|tmp$\|source_maps\|app\/assets\/images\|test\/reports\|node_modules\|bower_components\|^dist\|deps\|priv\|spec\/etl\/apangea'

" EasyGrep exclude
let g:EasyGrepFilesToExclude = 'tags,log,logs,tmp,temp,vendor/,spec/etl/apangea'

" Show trailing spaces as a dot
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Catch trailing whitespace
set list listchars=trail:.,tab:>>

" Window swapping
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! GitGrep(pattern)
    silent !clear
    execute "!git grep " . a:pattern
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
nmap <silent> <leader><space> :call TrimSpaces()<CR>

" Testy McTestertons
function! IsMinitest(filename)
  let split_filename = split(a:filename, ":")[0]
  return match(split_filename, '_test.rb$') != -1
endfunction

function! IsRspec(filename)
  let split_filename = split(a:filename, ":")[0]
  return match(split_filename, '_spec.rb$') != -1
endfunction

function! IsJasmine(filename)
  let split_filename = split(a:filename, ":")[0]
  return match(split_filename, '_spec.js$') != -1
endfunction

function! IsExUnit(filename)
  let split_filename = split(a:filename, ":")[0]
  return match(split_filename, '_test.exs$') != -1
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w

    if IsMinitest(a:filename)
      let command_to_run = "m " . a:filename
    elseif IsRspec(a:filename)
      let command_to_run = "rspec " . a:filename
    elseif IsJasmine(a:filename)
      let command_to_run = "jasmine-node " . a:filename
    elseif IsExUnit(a:filename)
      let command_to_run = "mix test " . a:filename
    end

    call VimuxRunCommand(command_to_run)
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
    let in_spec_file = IsMinitest(expand("%")) || IsRspec(expand("%")) || IsJasmine(expand("%")) || IsExUnit(expand("%"))
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

function! TrimSpaces()
    %s/\s*$//
    %s/\t/  /g
    ''
endfunction

map <leader>t :call RunTestFile()<cr><cr>
map <leader>T :call RunNearestTest()<cr><cr>
map <leader>a :call RunTests('spec')<cr><cr>
