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
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
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
" neocomplcache.vim
"----------------------------------------------------
let g:neocomplcache_enable_at_startup = 1


"----------------------------------------------------
" general
"----------------------------------------------------

set history=50 " command history count

" search
set ignorecase " ignore small case and large case
set smartcase  " if contain large case, noignore case
set wrapscan   " reword search from file top
set hlsearch   " search result high light

" view
syntax on
colorscheme wombat256
set number       " show line number
set title        " show file name as title
set ruler        " show cursor location
set list         " show $ as eol

" tab
set tabstop=4     " tab width equals count of space
set expandtab     " tab replace space
set shiftwidth=4  " indent count of space

" status 
set showcmd       " show key mapping at screen right buttom
set laststatus=2  " status line show config (2 = always show)

" indent
set autoindent    " new line indent equals pre line
set paste         " not autoindent by paste

" clipboard
set clipboard+=unnamed,autoselect

" file system
set nobackup      " not need backup file


set showmatch     " high light bracket

set encoding=utf-8

" cursor location save
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" gauche
autocmd FileType scheme :let is_gauche=1
autocmd FileType scheme setlocal complete+=k~/.gosh_completions


" vim scouter
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)














