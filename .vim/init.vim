" Load plugins
execute pathogen#infect()

" Set Leader key
:let mapleader = ","

filetype on
filetype plugin on
filetype indent on

syntax enable " Active syntax hilighting

""""""""" GENERAL SETS
set title " Set the title of iTerm tab
set showmatch
set showcmd
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set cindent
set sw=2
set autoindent
set tabstop=2
set expandtab
" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines

"""""""" OMNICOMPLETE
:set omnifunc=htmlcomplete#CompleteTags " Complete tags 
" alternatively enable tag completion only in html filetypes 
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"""""""" LINE NUMBERS
" show line numbers by default
:setlocal number 
" use F2 to toggle line numbers
nnoremap <F2> :set nonumber!<CR>


set wildmode=longest,list

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nnoremap <F9> :set list! list?<CR>

" Cycle between open buffers
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>


:nmap j gj
:nmap k gk

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
" This settings disables version controlled folders to be from searched.
" useful for example in projects with git submodules (submodule files not
" visible in CtrlP results)
" :let g:ctrlp_working_path_mode = 'ar'
:let g:ctrlp_map ='<leader>t'
:let g:ctrlp_cmd = 'CtrlP'
:let g:ctrlp_match_window_bottom = 1
:let g:ctrlp_match_window_reversed = 1
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|jpeg|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0
:nmap <leader>e :CtrlPBuffer<CR>


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic checkers
"let g:syntastic_javascript_checkers = ['eslint']

" Faster alias to toggle syntastic
" command Sd SyntasticToggleMode

" HTML5 omnicomplete
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

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

