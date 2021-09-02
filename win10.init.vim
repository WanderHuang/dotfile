call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugin for demonstration purpose
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
let mapleader = "'"
filetype on
filetype indent on
filetype indent plugin on
syntax on
set number
" set cursorline
set smartindent
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set wildmenu
set splitbelow

inoremap jk <Esc>

" theme
colorscheme gruvbox
set lines=35 columns=140
set guioptions-=e

" window
map gn :bn<cr>
map gp :bp<cr>
map <leader>w :bd<cr>
