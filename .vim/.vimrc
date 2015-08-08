colorscheme default

filetype on
filetype plugin on
syntax enable

set cindent
set sw=4
set autoindent

set tabstop=4
set expandtab

nnoremap <F2> :set nonumber!<CR>

set showmatch
set ruler

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmode=longest,list

execute pathogen#infect()

:nmap j gj
:nmap k gk

:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>
:nmap \q :nohlsearch<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

