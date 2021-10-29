"********************************************
" General settings and such
"********************************************
set nocompatible
language en_US

:let mapleader = "," "set leader key

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
set sw=3 " indent size (shiftwidth)
set tabstop=3 " number of spaces a tab in the file counts for
set expandtab " spaces, no tabs
set hidden " hide buffers instead of closing them
" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines (alternatively nowrap)
" set nrformats= " treat all numbers as decimals
set noswapfile

"********************************************
" Load PLUG plugin manager and Plugins
"********************************************
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
" Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'itspriddle/vim-marked'
Plug 'sheerun/vim-polyglot'
Plug 'mattreduce/vim-mix'
Plug 'tpope/vim-surround'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-obsession'
Plug 'mtth/scratch.vim'
Plug 'kshenoy/vim-signature'
Plug 'elixir-editors/vim-elixir'

" Plug 'w0rp/ale' "Better linter https://github.com/w0rp/ale

Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
autocmd! BufWritePost * Neomake

" Dadbod for database integration
Plug 'tpope/vim-dadbod'

Plug 'slashmili/alchemist.vim' "Elixir plugins

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" endif
" let g:deoplete#enable_at_startup = 1

Plug 'morhetz/gruvbox' "colorscheme from https://github.com/morhetz/gruvbox

" PSQL syntax hilighting
Plug 'lifepillar/pgsql.vim'

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" C# and dotnet
Plug 'OmniSharp/omnisharp-vim'

" For testing at a later date
Plug 'svermeulen/vim-cutlass' " Overrides deletions to just delete and not
" replace yank buffers
Plug 'svermeulen/vim-yoink' " Adds possibility to choose a buffer when
" pasting
" Plug 'svermeulen/vim-subversive' " Providers new operators to perform quick
" substitutions

call plug#end()

" Fix issues with some VUE components not properly syntax hilighted
autocmd FileType vue syntax sync fromstart


"********************************************
" Theming
"********************************************
" Enable true colors in iTerm2
if $TERM_PROGRAM == "iTerm.app"
	set termguicolors
endif

set background=dark

" fork here https://github.com/veturi/anderson.vim
" colorscheme anderson
colorscheme gruvbox


"********************************************
" Custom bindings and something random
"********************************************
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
" NEOMAKE 
"********************************************
" note: below should be done only for elixir files
let g:neomake_elixir_enabled_makers = ['credo']
autocmd! BufWritePost * Neomake


"********************************************
" NERDTree
"********************************************
nmap <leader>f :NERDTreeToggle<CR>
au VimEnter * NERDTree " Auto open NERDTree
au VimEnter * wincmd l " Target the actual file window upon opening
" Focus to NERDTree viewport
nmap <leader>w :NERDTreeFocus<CR> 
" Show file in NERDTree
nmap <leader>W :NERDTreeFind<CR> 


"********************************************
" CtrlP
"********************************************
" This settings disables version controlled folders to be from searched.
" useful for example in projects with git submodules (submodule files not
" visible in CtrlP results)
" :let g:ctrlp_working_path_mode = 'ar'
" :let g:ctrlp_map ='<leader>t'
" :let g:ctrlp_cmd = 'CtrlP'
" :let g:ctrlp_match_window_bottom = 1
" :let g:ctrlp_match_window_reversed = 1
" :let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|jpeg|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" :let g:ctrlp_working_path_mode = 0
" :let g:ctrlp_dotfiles = 0
" :let g:ctrlp_switch_buffer = 0
" :nmap <leader>e :CtrlPBuffer<CR>


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
" Vim PSQL
" https://github.com/lifepillar/pgsql.vim
"********************************************
" by default treat .sql files with postgres syntax hilighting
let g:sql_type_default = 'pgsql'


"********************************************
" nvim coc
"********************************************
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

"" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show file outline with leader-c-o
nnoremap <silent> <leader>co :<C-u>CocList outline<CR>

"********************************************
" yoink
"********************************************
let g:yoinkIncludeDeleteOperations = 1
"nmap <C-K> <plug>(YoinkPostPasteSwapBack)
"nmap <C-J> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

"********************************************
" vim tabs
"********************************************
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR> 


"********************************************
" FZF
"********************************************
" Sets colorscheme to match VIM color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" CTRL T, CTRL X and CTRL V split from FZF results
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <leader>e :Buffers<CR>
nnoremap <leader>E :Lines<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>T :GFiles<CR>
nnoremap <leader>r :History:<CR>
nnoremap <leader>R :History/<CR>
nnoremap <leader>y :Ag<CR>
