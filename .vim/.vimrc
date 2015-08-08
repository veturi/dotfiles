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

set wildmode=longest,list

execute pathogen#infect()

:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>

"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
