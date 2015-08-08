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

" NERDTree
:nmap \e :NERDTreeToggle<CR>

" CtrlP
:nmap ; :CtrlPBuffer<CR>
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|jpeg|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

