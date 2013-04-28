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

filetype plugin indent on     " required!


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


" Shortcuts
map <C-s> :w<CR>
imap <C-S> <esc><C-S>

map <C-n> :NERDTreeToggle<CR>
