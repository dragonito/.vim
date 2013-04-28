set nocompatible               " be iMproved
filetype off                   " required!

" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
Bundle 'groenewege/vim-less'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'vim-scripts/colorschemer'

filetype plugin indent on     " required!

set number " Zeilennummer
set bg=dark
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set hlsearch

set encoding=utf-8
" display filename
set modeline
set ls=2

filetype indent on

set t_Co=256
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

syntax on
"set background=dark
colorscheme jellybeans


" Shortcuts
map <C-n> :NERDTreeToggle<CR>
