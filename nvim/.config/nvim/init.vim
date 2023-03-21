lua require('plugins')

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
let g:airline#extensions#tabline#enabled = 1 " Show tabline on the top using airline
let g:airline#extensions#tabline#buffer_nr_show = 1 " Show the number on the tabs

" Do not create backup/swap/undo files
set nobackup
set noswapfile
set noundofile

" Custom maps
let mapleader="\<SPACE>"
inoremap jj <Esc>
nmap l o<Esc>
nmap L O<Esc>
nmap h :nop<CR>
nmap j :nop<CR>
nmap k :nop<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bn :bnext<CR>
nnoremap <leader>x :NERDTree<CR>
nnoremap <leader>X :NERDTreeToggle<CR>

" lsp mappings
"nnoremap('<leader>gu', 'Telescope lsp_references')
"nnoremap('<leader>gd', 'Telescope lsp_definitions')
"nnoremap('<leader>rn', 'lua vim.lsp.buf.rename()')
"nnoremap('<leader>dn', 'lua vim.lsp.diagnostic.goto_next()')
"nnoremap('<leader>dN', 'lua vim.lsp.diagnostic.goto_prev()')
"nnoremap('<leader>dd', 'Telescope lsp_document_diagnostics')
"nnoremap('<leader>dD', 'Telescope lsp_workspace_diagnostics')
"nnoremap('<leader>xx', 'Telescope lsp_code_actions')
"nnoremap('<leader>xd', '%Telescope lsp_range_code_actions')

nnoremap <C-t> <cmd>Telescope find_files<cr>

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
