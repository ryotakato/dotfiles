" neovim init.vim


" dein.vim {{{
"----------------------------------------------------
if &compatible
    set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/nvim/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let s:toml      = '$XDG_CONFIG_HOME/nvim/dein/plugins.toml'
let s:lazy_toml = '$XDG_CONFIG_HOME/nvim/dein/plugins_lazy.toml'

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [s:toml, s:lazy_toml])
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}



" general "{{{
"----------------------------------------------------

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,sjis,latin1,iso-2022-jp,euc-jp

set history=50 " command history count

" search
set ignorecase " ignore small case and large case
set smartcase  " if contain large case, noignore case
set wrapscan   " reword search from file top
set hlsearch   " search result high light

" view
syntax on
set number       " show line number
set title        " show file name as title
set ruler        " show cursor location
set list         " show $ as eol
set textwidth=0  " not need one line upper limit

if(has('macunix'))
  set t_Co=256
  colorscheme wombat256
elseif (has('unix'))
  set t_Co=256
  colorscheme wombat256mod
endif

" tab
set tabstop=4     " tab width equals count of space
set expandtab     " tab replace space
set shiftwidth=4  " indent count of space

" status 
set showcmd       " show key mapping at screen right buttom
set laststatus=2  " status line show config (2 = always show)

" indent
set autoindent    " new line indent equals pre line
"set paste        " not autoindent by paste -> if 'set paste', influence to other option and neocomplcache, so not set.

" clipboard
"set clipboard+=unnamed,autoselect TODO neovim not working

" file system
set nobackup      " not need backup file


set showmatch     " high light bracket

" foldmethod
set foldmethod=marker 

" backspace
set backspace=indent,eol,start


" cursor location save "{{{
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif"}}}

" Gauche config "{{{
augroup Gauche 
    autocmd!
    " variable"
    autocmd FileType scheme :let is_gauche=1
    " comment out"
    autocmd FileType scheme vnoremap ; :s/^/;/<CR>:nohlsearch<CR>
    autocmd FileType scheme vnoremap ,c :s/^;//<CR>:nohlsearch<CR>
augroup END"}}}

" vim config "{{{
augroup Vim 
    autocmd!
    " comment out"
    autocmd FileType vim vnoremap ," :s/^/\"/<CR>:nohlsearch<CR>
    autocmd FileType vim vnoremap ,c :s/^"//<CR>:nohlsearch<CR>
augroup END"}}}


" nohlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" help cursol word
"nnoremap hw :<C-u>help<Space><C-r><C-w><CR>

" macro remap, because q is often misstake
noremap q <Nop>
noremap zq q
noremap @ <Nop>
noremap z@ @

inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Right> gt
nnoremap <Left> gT
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>







"}}}
