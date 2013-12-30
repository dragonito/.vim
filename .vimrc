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
Bundle 'mattn/emmet-vim'
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
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tsaleh/vim-matchit'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-surround'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'docteurklein/vim-symfony'
Bundle 'junegunn/vim-easy-align'
Bundle 'vim-scripts/delimitMate.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'othree/xml.vim'

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


" OmniCppComplete (strg+x then strg+o)
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" " automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


" Vim-Markdown config
let g:vim_markdown_folding_disabled=1

" Create directory on save if it does not exist
" http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
augroup BWCCreateDir
    au!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" ctrlp config
let g:ctrlp_working_path_mode = ''
let g:ctrlp_abbrev = {
    \ 'gmode': 'i',
    \ 'abbrevs': [
        \ {
            \ 'pattern': '_',
            \ 'expanded': ''
        \ },
        \ {
            \ 'pattern': '\\',
            \ 'expanded': ''
        \ },
        \ {
            \ 'pattern': ';',
            \ 'expanded': ''
        \ }
    \ ]
\ }


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep= ' '
let g:airline_right_sep=' '

" php-cs-fixe plugin
" let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = "linefeed,indentation,trailing_spaces,unused_use,php_closing_tag,return,visibility,braces,phpdoc_params,eof_ending,extra_empty_lines,controls_spaces,elseif"             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.


" syntastic
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Shortcuts
let mapleader = ","
let maplocalleader = ","

let g:user_emmet_expandabbr_key = '<c-h>'

map <C-n> :NERDTreeTabsToggle<CR>
map <C-m> :TlistToggle<CR>

noremap <F3> :Autoformat<CR><CR>

nnoremap <leader>f :CtrlP<CR>
nmap <leader>fw :CtrlP<CR><C-\>w
vmap <leader>fW yW:CtrlP<CR><C-\>c
vmap <leader>fw y:CtrlP<CR><C-\>c

nnoremap <leader>t :tabe<CR>


" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)


nmap <leader>s :execute ":!"g:symfony_enable_shell_cmd<CR>
