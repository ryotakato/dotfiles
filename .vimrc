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
NeoBundle 'kana/vim-surround'
NeoBundle 'fuenor/qfixhowm'
" from vim-srcipts
NeoBundle 'groovy.vim'
NeoBundle 'sudo.vim'
" from other
NeoBundle 'https://github.com/haruyama/scheme.vim.git'


filetype plugin on
filetype indent on


"----------------------------------------------------
" qfixhowm.vim
"----------------------------------------------------

" key map leader
let QFixHowm_Key = 'g'

" howm root dir
let QFixHowm_RootDir = '~/howm'

" howm config
let howm_dir             = QFixHowm_RootDir.'/main'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

" howm MRU config
let QFixMRU_Filename     = QFixHowm_RootDir.'/.qfixmru'

" howm keyword config
let QFixHowm_keywordfile = QFixHowm_RootDir.'/.howm-keys'

" howm grep config
let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$|[/\\]holiday[/\\]'

" howm memo
let QFixHowm_FileType = 'qfix_memo'

" howm wiki config
let QFixHowm_Wiki = 1
let QFixHowm_WikiDir = 'wiki'

" howm calender holiday
let QFixHowm_HolidayFile = QFixHowm_RootDir.'/holiday/Sche-Hd-0000-00-00-000000.howm'

" howm todo pattern
let QFixHowm_ListReminder_ScheExt = '[-@+!~]'


"----------------------------------------------------
" general
"----------------------------------------------------

set history=50

" search
set ignorecase
set smartcase
set wrapscan
set hlsearch


" gauche
autocmd FileType scheme :let is_gauche=1
autocmd FileType scheme setlocal complete+=k~/.gosh_completions


" view
syntax on
colorscheme wombat256
set number
set title
set ruler
set list

set showcmd

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

set laststatus=2

" not autoindent By paste
set paste

" clipboard
set clipboard+=unnamed,autoselect

" file system
set nobackup


set showmatch

set encoding=utf-8



