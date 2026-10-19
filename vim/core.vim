"********************************************
" Shared core config for vim and neovim.
" No plugins, so it works on any remote host as-is:
"   curl -fsSL https://raw.githubusercontent.com/veturi/dotfiles/master/vim/core.vim -o ~/.vimrc
" Neovim sources this first and adds plugins on top (config/nvim).
"********************************************
set nocompatible
silent! language en_US

let mapleader = "," " set leader key

filetype plugin indent on
syntax enable " Active syntax hilighting

set title " Set the title of terminal tab
set showmatch " briefly show matching bracket if on screen
set ruler " show line and col nr
set hlsearch " hilight search results
set incsearch " incremental search results (search as you type)
set ignorecase " ignore case when searching
set smartcase " overrides ignorecase option if search string contains uppercase chars
set cindent " c identing rules
set autoindent " always use autoindenting
set copyindent " retain indentation level
set shiftround " use multiples of shiftwidth when indenting with < & >
set sw=3 " indent size (shiftwidth)
set tabstop=3 " number of spaces a tab in the file counts for
set expandtab " spaces, no tabs
set hidden " hide buffers instead of closing them
set noswapfile
set backspace=indent,eol,start
set updatetime=300
set number " show line numbers by default

" Fix issues with some VUE components not properly syntax hilighted
autocmd FileType vue syntax sync fromstart

" Erlang/Elixir files that vim doesn't detect by default
autocmd BufRead,BufNewFile *.exs,*.ex set filetype=elixir
autocmd BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface set filetype=eelixir
autocmd BufRead,BufNewFile mix.lock set filetype=elixir


"********************************************
" Theming
"********************************************
if has('termguicolors') && ($COLORTERM ==# 'truecolor' || $TERM_PROGRAM ==# 'iTerm.app')
  set termguicolors
endif

set background=dark
" Fallback colorscheme for plain vim. Neovim overrides with gruvbox.
" fork here https://github.com/veturi/anderson.vim
if !has('nvim')
  silent! colorscheme anderson
endif


"********************************************
" Custom bindings and something random
"********************************************
" use w!! to open non-sudoed file as a sudo
cmap w!! w !sudo tee % >/dev/null

" terminal mode specific remap to use esc for escaping to normal mode
if has('nvim') || has('terminal')
  tnoremap <Esc> <C-\><C-n>
endif

" wildmode for command autocompletion
set wildmode=longest:list,full

" toggle display of hidden characters and set options
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nnoremap <F9> :set list! list?<CR>

" Cycle between open buffers with
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

nmap j gj
nmap k gk

" Paste from "0 register populated by yanks only
nmap <leader>p "0p<CR>
nmap <leader>P "0P<CR>

" disable search hilight
nmap <leader>q :nohlsearch<CR>

" split line from current position (LSP buffers in neovim use K for hover)
nnoremap K i<CR><ESC>

" use F2 to toggle line numbers
nnoremap <F2> :set nonumber!<CR>

" close current buffer and switch to previous without closing window / split
nmap <leader>d :b#<bar>bd#<CR>

" vim tabs
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>


"********************************************
" Split pane movement and configuration
"********************************************
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


"********************************************
" OMNICOMPLETE
"********************************************
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0


"********************************************
" Markdown / SQL
"********************************************
let g:vim_markdown_folding_disabled=1
" by default treat .sql files with postgres syntax hilighting (pgsql.vim)
let g:sql_type_default = 'pgsql'
