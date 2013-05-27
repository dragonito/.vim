set nocompatible               " be iMproved
set nopaste                    " paste mode deaktivieren
filetype off                   " required!

" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
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
Bundle 'scrooloose/syntastic'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'tsaleh/vim-matchit'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'

" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'


filetype plugin indent on     " required!

" include
source ~/.vim/scripts/PhpNamespace.vim
source ~/.vim/scripts/Symfony2.vim

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
set wildignore+=*/cache/*,*/vendor/**/tests/*

" Vim-Markdown config
let g:vim_markdown_folding_disabled=1

" ctrlp config
let g:ctrlp_workng_path_mode = ''

" php-cs-fixe plugin
let g:php_cs_fixer_path = "php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = "linefeed,indentation,trailing_spaces,unused_use,php_closing_tag,return,visibility,braces,phpdoc_params,eof_ending,extra_empty_lines,controls_spaces,elseif"             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.

" Shortcuts
let mapleader = ","
let maplocalleader = ","

map <C-n> :NERDTreeToggle<CR>

noremap <F3> :Autoformat<CR><CR>

nnoremap <leader>f :CtrlP<CR>
nmap <leader>fw :CtrlP<CR><C-\>w
vmap <leader>fw y:CtrlP<CR><C-\>c

nnoremap <leader>t :tabe<CR>
nnoremap <leader>n :tabnext<CR>
