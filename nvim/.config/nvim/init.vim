set nocompatible                    " disable compatibility to old-time vi
set showmatch                       " show matching 
set ignorecase                      " case insensitive 
set mouse=v                         " middle-click paste with 
set hlsearch                        " highlight search 
set incsearch                       " incremental search
set tabstop=4                       " number of columns occupied by a tab 
set softtabstop=4                   " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                       " converts tabs to white space
set shiftwidth=4                    " width for autoindents
set autoindent                      " indent a new line the same amount as the line just typed
set number                          " add line numbers
set wildmode=longest,list           " get bash-like tab completions
filetype plugin indent on           " allow auto-indenting depending on file type
syntax on                           " syntax highlighting
set mouse=a                         " enable mouse click
set clipboard=unnamedplus           " using system clipboard
filetype plugin on
set ttyfast                         " Speed up scrolling in Vim
let g:airline_theme='bubblegum'     " Theme is bubblegum
let g:airline_powerline_fonts = 1   " Use powerline fonts in airline

" Do not create backup/swap/undo files
set nobackup
set noswapfile
set noundofile

" Custom maps
inoremap jj <Esc>

call plug#begin()
 Plug 'dracula/vim', { 'as': 'dracula' }
 Plug 'ryanoasis/vim-devicons'
 Plug 'mhinz/vim-startify'
 Plug 'vim-airline/vim-airline'
 Plug 'preservim/nerdtree'
 Plug 'vim-airline/vim-airline-themes'
call plug#end()

" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable

" colorscheme evening
 colorscheme dracula 
 
" open new split panes to right and below
 set splitright
 set splitbelow
