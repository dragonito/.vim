set nocompatible               " be iMproved
filetype off                   " required!

" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
Bundle 'groenewege/vim-less'
Bundle 'nanotech/jellybeans.vim'
Bundle 'ap/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'airblade/vim-gitgutter'
Bundle 'evidens/vim-twig'
Bundle 'plasticboy/vim-markdown'
Bundle 'Chiel92/vim-autoformat'
Bundle 'kien/ctrlp.vim'
Bundle 'Glench/Vim-Jinja2-Syntax'

" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'


filetype plugin indent on     " required!

" include
source ~/.vim/scripts/PhpNamespace.vim


" Anzeige
set t_Co=256
syntax on
set number " Zeilennummer
colorscheme jellybeans

" Encoding
set encoding=utf-8

" Format
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set modeline
set ls=2

" Search
set hlsearch
set ignorecase

" Automatisches einrücken
filetype indent on
set autoindent

" file autocomplete
set wildmenu
set wildmode=list:longest
set wildignore+=*/app/main/cache/*,*/app/cache/*,*/vendor/**/tests/*

" Vim-Markdown config
let g:vim_markdown_folding_disabled=1

" ctrlp config
let g:ctrlp_working_path_mode = ''

" Shortcuts
let mapleader = ","
let maplocalleader = ","

map <C-n> :NERDTreeToggle<CR>

noremap <F3> :Autoformat<CR><CR>

nnoremap <leader>f :CtrlP<CR>
nmap <leader>fw :CtrlP<CR><C-\>w
vmap <leader>fw y:CtrlP<CR><C-\>c
