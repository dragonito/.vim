set nocompatible               " be iMproved
set nopaste                    " paste mode deaktivieren
filetype off                   " required!

" Init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Plugin 'gmarik/vundle'
Plugin 'mattn/webapi-vim'

let config = webapi#json#decode(system('cat ~/.vim/default.json'))

if filereadable(expand("~/.vim/config.json"))
    call extend(config, webapi#json#decode(system('cat ~/.vim/config.json')))
endif

if filereadable(expand("project.json"))
    call extend(config, webapi#json#decode(system('project.json')))
endif

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mhinz/vim-signify'
Plugin 'evidens/vim-twig'
Plugin 'plasticboy/vim-markdown'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kien/ctrlp.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'scrooloose/syntastic'
" Plugin 'tsaleh/vim-matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/taglist.vim'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'Raimondi/delimitMate'
" Plugin 'gregsexton/MatchTag'
Plugin 'pangloss/vim-javascript'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'

" Experiment
" Plugin 'arnaud-lb/vim-php-namespace'
" Plugin 'docteurklein/vim-symfony'
" Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'chrisbra/csv.vim'


filetype plugin indent on     " required!

" include
source ~/.vim/scripts/PhpNamespace.vim
source ~/.vim/scripts/Symfony2.vim

" Snippets
let g:snips_author='David Badura <d.a.badura@gmail.com>'

" Anzeige
set t_Co=256
syntax on
set number " Zeilennummer

exec "colorscheme " . config['colorscheme']

let html_no_rendering = 1
set t_ut=

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

" tags
set tags+=./tags.vendors,tags.vendors

" syntastic
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args="--standard=PSR2 --report=csv --warning-severity=6"

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Nerdtree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['^\.git$', '^\.svn$', '\.swp$']
let g:NERDTreeDirArrows=0

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

" php-namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

if filereadable(expand("~/.my_vimrc"))
    source ~/.my_vimrc
endif
