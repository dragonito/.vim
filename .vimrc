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
Bundle 'nanotech/jellybeans.vim'
"Bundle 'skammer/vim-css-color' <- performance problem
Bundle 'hail2u/vim-css3-syntax'
Bundle 'airblade/vim-gitgutter'
Bundle 'evidens/vim-twig'


filetype plugin indent on     " required!

" Anzeige
set t_Co=256 "/ add 'export TERM="xterm-256color"' in $HOME/.bashrc
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

" Shortcuts
map <C-n> :NERDTreeToggle<CR>
