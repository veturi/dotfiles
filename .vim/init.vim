filetype on
filetype plugin on
filetype indent on
syntax enable

set cindent
set sw=2
set autoindent

set tabstop=2
set expandtab

" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines

:let mapleader = ","

nnoremap <F2> :set nonumber!<CR>

set showmatch
set showcmd
set ruler

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmode=longest,list

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nnoremap <F9> :set list! list?<CR>

" Cycle between open buffers
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

execute pathogen#infect()

:nmap j gj
:nmap k gk

:setlocal number " show line numbers by default
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>
:nmap \q :nohlsearch<CR>

" split line from current position
nnoremap K i<CR><ESC>

" Split pane movement and configuration
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" NERDTree
:nmap <leader>f :NERDTreeToggle<CR>
au VimEnter * NERDTree " Auto open NERDTree
au VimEnter * wincmd l " Target the actual file window upon opening

" CtrlP
:let g:ctrlp_map ='<leader>t'
:let g:ctrlp_cmd = 'CtrlP'
:let g:ctrlp_match_window_bottom = 1
:let g:ctrlp_match_window_reversed = 1
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|jpeg|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0
:nmap <leader>e :CtrlPBuffer<CR>
:nmap <leader>y :CtrlPMixed<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

" command Sd SyntasticToggleMode

" Markdown
let g:vim_markdown_folding_disabled=1

" close current buffer and switch to previous without closing window / split
nmap ,d :b#<bar>bd#<CR>

language en_US

set pastetoggle=<F10>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

colorscheme anderson

