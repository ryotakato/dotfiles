" .vimrc

"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/automatic/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/automatic/'))
endif

" from creator
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
" from vim-srcipts
NeoBundle 'groovy.vim'
NeoBundle 'sudo.vim'
" from other
NeoBundle 'https://github.com/haruyama/scheme.vim.git'

filetype plugin on
filetype indent on



" General
set history=50

" Search
set ignorecase
set smartcase
set wrapscan
set hlsearch


" pathogen
"call pathogen#runtime_append_all_bundles()

" gauche
autocmd FileType scheme :let is_gauche=1
autocmd FileType scheme setlocal complete+=k~/.gosh_completions


" View
syntax on
colorscheme wombat256
set number
set title
set ruler
set list

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" not autoindent By paste
set paste

" clipboard
set clipboard+=unnamed,autoselect

" File system
set nobackup


set showmatch

set encoding=utf-8



