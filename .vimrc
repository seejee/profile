runtime macros/matchit.vim

let mapleader = ","
let maplocalleader = "\\"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'wojtekmach/vim-rename'
Bundle 'airblade/vim-gitgutter'
Bundle 'L9'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'benmills/vimux'
Bundle 'kien/rainbow_parentheses.vim'

Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/EasyGrep'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'plasticboy/vim-markdown'

Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-haml'

Bundle 'guns/vim-clojure-highlight'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-fireplace'
Bundle 'paredit.vim'

Bundle 'SQLUtilities'
Bundle 'Align'

Bundle 'digitaltoad/vim-jade'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mustache/vim-mustache-handlebars'

Bundle 'elixir-lang/vim-elixir'

Bundle 'jnwhiteh/vim-golang'

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

set macmeta

map Y y$

" reload .vimrc when it is save
au BufWritePost .vimrc so ~/.vimrc
au BufRead,BufNewFile *.ctl set filetype=ruby
au BufRead,BufNewFile *.ctl set syntax=ruby
au BufRead,BufNewFile *.ebf set filetype=ruby
au BufRead,BufNewFile *.ebf set syntax=ruby
autocmd BufRead,BufNewFile *.slimbars setlocal filetype=slim

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
set wildignore+=*.png,*.jpg,*.pdf,*.swf
let g:ctrlp_custom_ignore = '\.git$\|\.o$\|\.app$\|\.beam$\|\.dSYM\|\.ipa$\|\.csv\|tags\|public\/images$\|public\/uploads$\|log\|tmp$\|source_maps\|app\/assets\/images\|test\/reports\|node_modules\|bower_components\|dist'

" Show trailing spaces as a dot
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Catch trailing whitespace
set list listchars=trail:.,tab:>>

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
    :silent !echo;echo;echo;echo;echo

    if IsMinitest(a:filename)
      let command_to_run = "m " . a:filename
    elseif IsRspec(a:filename)
      let command_to_run = "rspec " . a:filename
    elseif IsJasmine(a:filename)
      let command_to_run = "jasmine-node " . a:filename
    elseif IsExUnit(a:filename)
      let command_to_run = "elixir " . a:filename
    end

    call VimuxRunCommand(command_to_run)
    redraw!
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
