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
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-surround'
NeoBundle 'aharisu/Gauche-Complete'
NeoBundle 'mattn/calendar-vim'
" from vim-srcipts
NeoBundle 'groovy.vim'
NeoBundle 'sudo.vim'
NeoBundle 'vimwiki'
" from other
NeoBundle 'https://github.com/haruyama/scheme.vim.git'


filetype plugin on
filetype indent on

"----------------------------------------------------
" unite.vim
"----------------------------------------------------
" unite option config
let g:unite_source_file_mru_limit = 50
let g:unite_source_file_mru_filename_format = ''

" unite prefix key
nnoremap [unite] <Nop>
nmap <Space> [unite]

" file current dir
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" buffer
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" register
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" mru
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" bookmark
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" add bookmark
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" key mapping unite window
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
 " unite quit
 nmap <buffer> <ESC> <Plug>(unite_exit)
 " change to normal mode
 imap <buffer> jj <Plug>(unite_insert_leave)
 " delete last path
 imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
 " open at split horizontal
 nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 " open at split vertical
 nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 " open at here
 nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
 inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}


"----------------------------------------------------
" neocomplcache.vim
"----------------------------------------------------
let g:neocomplcache_enable_at_startup = 1

" snippets config 
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" completion tab select config
if !exists("*InsertTabWrapper")
    function InsertTabWrapper()
        if pumvisible()
            return "\<c-n>"
        endif
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k\|<\|/'
            return "\<tab>"
        elseif exists('&omnifunc') && &omnifunc == ''
            return "\<c-n>"
        else
            return "\<c-x>\<c-o>"
        endif
    endfunction
endif
inoremap <tab> <c-r>=InsertTabWrapper()<cr>


"----------------------------------------------------
" vimwiki
"----------------------------------------------------
" wiki home dir -> ~/vimfiles/vimwiki/wiki/
" html home dir -> ~/vimfiles/vimwiki/html/
" wiki open by  -> vsplit
:let g:vimwiki_list = [{'path':'~/vimfiles/vimwiki/wiki/', 'path_html':'~/vimfiles/vimwiki/html/','gohome':'vsplit' }]


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
set textwidth=0  " not need one line upper limit

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
set clipboard+=unnamed,autoselect

" file system
set nobackup      " not need backup file


set showmatch     " high light bracket

set encoding=utf-8

" cursor location save
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Gauche config
augroup Gauche 
    autocmd!
    " variable"
    autocmd FileType scheme :let is_gauche=1
    " comment out"
    autocmd FileType scheme vnoremap ; :s/^/;/<CR>:nohlsearch<CR>
    autocmd FileType scheme vnoremap ,c :s/^;//<CR>:nohlsearch<CR>
augroup END

" vim config
augroup Vim 
    autocmd!
    " comment out"
    autocmd FileType vim vnoremap ," :s/^/\"/<CR>:nohlsearch<CR>
    autocmd FileType vim vnoremap ,c :s/^"//<CR>:nohlsearch<CR>
augroup END

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

" bracket inoremap (vnoremap is no need, because surround.vim) 
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>

" nohlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>






