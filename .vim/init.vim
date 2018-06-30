set nocompatible " hail VIM

set background=dark
" set termguicolors

" Load Plug and plugins
if has('nvim') && empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
elseif empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'osyo-manga/vim-over'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'itspriddle/vim-marked'
Plug 'veturi/elm-vim'
Plug 'sheerun/vim-polyglot'
Plug 'mattreduce/vim-mix'
Plug 'tpope/vim-surround'
" Plug 'ludovicchabant/vim-gutentags'

Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake

" Elixir plugins
Plug 'slashmili/alchemist.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 1

" colorscheme from https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

call plug#end()


language en_US

" fork here https://github.com/veturi/anderson.vim
" colorscheme anderson
colorscheme gruvbox

" Set Leader key
:let mapleader = ","

filetype on
filetype plugin on
filetype indent on

syntax enable " Active syntax hilighting

set title " Set the title of iTerm tab
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
set sw=2 " indent size (shiftwidth)
set tabstop=2 " number of spaces a tab in the file counts for
set expandtab " spaces, no tabs
set hidden " hide buffers instead of closing them
" set showcmd " show count of items in selection (chars, rows, lines*cols)
" set mouse=a " enable cheatmode
" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines (alternatively nowrap)
" set nrformats= " treat all numbers as decimals

" use w!! to open non-sudoed file as a sudo
cmap w!! w !sudo tee % >/dev/null

" terminal mode specific remap to use esc for escaping to normal mode (nvim)
:tnoremap <Esc> <C-\><C-n>

" wildmode for command autocompletion
set wildmode=longest:list,full

" toggle display of hidden characters and set options
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nnoremap <F9> :set list! list?<CR>

" Cycle between open buffers with
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

:nmap j gj
:nmap k gk

" toggle paste mode
:nmap <leader>o :set paste!<CR>
set pastetoggle=<F10>

" Paste from "0 register populated by yanks only
nmap <leader>p "0p<CR>
nmap <leader>P "0P<CR>

" disable search hilight
:nmap <leader>q :nohlsearch<CR>

" split line from current position
nnoremap K i<CR><ESC>

:setlocal number " show line numbers by default
" use F2 to toggle line numbers
nnoremap <F2> :set nonumber!<CR>

" close current buffer and switch to previous without closing window / split
nmap <leader>d :b#<bar>bd#<CR>


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
:set omnifunc=htmlcomplete#CompleteTags " Complete tags 
" alternatively enable tag completion only in html filetypes 
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


"********************************************
" ALCHEMIST (elixir)
"********************************************
" let g:alchemist_tag_disable = 1 " disable the half-assed version of ctags
" let g:alchemist_iex_term_size = 10 " alchemist iex term height in rows
" let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
" note: below should be done only for elixir files
map <C-5> :ExDef<CR>


"********************************************
" NERDTree
"********************************************
:nmap <leader>f :NERDTreeToggle<CR>
au VimEnter * NERDTree " Auto open NERDTree
au VimEnter * wincmd l " Target the actual file window upon opening
" Focus to NERDTree viewport
:nmap <leader>w :NERDTreeFocus<CR> 
" Show file in NERDTree
:nmap <leader>W :NERDTreeFind<CR> 


"********************************************
" CtrlP
"********************************************
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


"********************************************
" Syntastic
"********************************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
" Faster alias to toggle syntastic
" command Sd SyntasticToggleMode


"********************************************
" HTML5 omnicomplete
"********************************************
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0


"********************************************
" Markdown
"********************************************
let g:vim_markdown_folding_disabled=1


"********************************************
" Lightline
"********************************************
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }


"********************************************
" MarkedToggle
"********************************************
nmap <leader>m :MarkedToggle!<CR>


"********************************************
" Vim ELM
"********************************************
let g:elm_setup_keybindings = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
