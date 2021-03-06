" .vimrc

" neobundle.vim "{{{
"----------------------------------------------------
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/automatic/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/automatic/'))
endif

" plugins
NeoBundle 'Shougo/vimproc', {'build': { 'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak',},}
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite-build'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ryotakato/unite-outline-objc'
NeoBundle 'ryotakato/unite-outline-vimwiki'
NeoBundle 'ryotakato/unite-mongodb'
NeoBundle 'ryotakato/unite-pomodoro'
NeoBundle 'ryotakato/unite-gradle'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-surround'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'LeafCage/foldCC'
NeoBundle 'sudo.vim'
NeoBundle 'vimwiki'
NeoBundle 'deris/columnjump'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'kana/vim-altr'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'gregsexton/Vomodoro'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tyru/restart.vim'
NeoBundle 'timcharper/textile.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'kana/vim-metarw'
NeoBundle 'emonkak/vim-metarw-gist'
NeoBundle 'hakobe/unite-script-examples'
NeoBundle 'ryotakato/vim-itunes'
NeoBundle 'derekwyatt/vim-scala'

NeoBundleLazy 'pekepeke/titanium-vim', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'myhere/vim-nodejs-complete', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'kchmck/vim-coffee-script' " coffeescript is not default filetype 
NeoBundle 'markschabacker/cocoa.vim' " cocoa.vim is work only filetype objc
NeoBundleLazy 'tpope/vim-rails', { 'autoload' : {'filetypes' : ['ruby']}}
NeoBundleLazy 'groovy.vim', { 'autoload' : {'filetypes' : ['groovy']}}
NeoBundleLazy 'aharisu/vim-gdev', { 'autoload' : {'filetypes' : ['scheme']}}
NeoBundleLazy 'https://github.com/haruyama/scheme.vim.git', { 'autoload' : {'filetypes' : ['scheme']}}
NeoBundleLazy 'gauref.vim', { 'autoload' : {'filetypes' : ['scheme']}}


filetype plugin on
filetype indent on

"augroup JavaScript_NeoBundle "{{{
"    autocmd!
"    autocmd FileType javascript NeoBundleSource titanium-vim
"    autocmd FileType javascript NeoBundleSource vim-javascript
"augroup END"}}}
"augroup Ruby_NeoBundle "{{{
"    autocmd!
"    autocmd FileType ruby NeoBundleSource vim-rails
"augroup END"}}}
"augroup Groovy_NeoBundle "{{{
"    autocmd!
"    autocmd FileType groovy NeoBundleSource groovy.vim
"augroup END"}}}
"augroup Scheme_NeoBundle "{{{
"    autocmd!
"    autocmd FileType scheme NeoBundleSource vim-gdev
"    autocmd FileType scheme NeoBundleSource scheme.vim
"augroup END"}}}



"}}}


" unite.vim "{{{
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
" line
nnoremap <silent> [unite]l :<C-u>Unite line<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
" help
nnoremap <silent> [unite]h :<C-u>Unite help<CR>
" outline
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
" mongodb
nnoremap <silent> [unite]d :<C-u>Unite mongodb<CR>
" key mapping unite window
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
 " unite quit
 nmap <buffer> <ESC> <Plug>(unite_exit)
 " change to normal mode
 imap <buffer> jj <Plug>(unite_insert_leave)
 " delete last path
 imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
 nmap <buffer> .. <Plug>(unite_delete_backward_path) 
 " open at split horizontal
 nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 " open at split vertical
 nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 " open at here
 nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
 inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
 " unite mongodb mapping
 nmap <buffer> m <Plug>(unite_mongodb_back)
endfunction"}}}
"}}}


" vimfiler "{{{
"----------------------------------------------------
" default explorer"
let g:vimfiler_as_default_explorer = 1
" edit file by tabedit.
let g:vimfiler_edit_action = 'tabopen'
"}}}


" neocomplete.vim "{{{
"----------------------------------------------------
let g:neocomplete#enable_at_startup = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'javascript' : $HOME.'/.vim/dict/jquery.dict'.','.$HOME.'/.vim/dict/javascript.dict'
    \ }

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

"}}}


" neosnippet.vim "{{{
"----------------------------------------------------

" <TAB>: completion.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><CR> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"}}}


" quickrun "{{{

let g:quickrun_config = {}
set splitright

"}}}


" vimwiki "{{{
"----------------------------------------------------
" wiki home dir -> ~/vimfiles/vimwiki/wiki/
" html home dir -> ~/vimfiles/vimwiki/html/
" wiki open by  -> vsplit
let g:vimwiki_list = [{'path':'~/vimfiles/vimwiki/wiki/', 'path_html':'~/vimfiles/vimwiki/html/','gohome':'vsplit' }]
" .md is not vimwiki, so exclude.
let g:vimwiki_ext2syntax = {}

augroup VimWikiTemplate
    autocmd!
    autocmd BufNewFile ~/vimfiles/vimwiki/wiki/*.wiki 0r ~/vimfiles/vimwiki/wiki/template
augroup END

"}}}


" foldCC "{{{
"----------------------------------------------------
set foldtext=FoldCCtext()
set foldcolumn=0
set fillchars=vert:\|
"}}}


" columnjump "{{{
"----------------------------------------------------
nmap <c-k> <Plug>(columnjump-backward)
nmap <c-j> <Plug>(columnjump-forward)
"}}}


" vim-altr "{{{
"----------------------------------------------------
"nmap <c-a>  <Plug>(altr-forward)
"}}}


" vim-smartchr "{{{
"----------------------------------------------------
inoremap <expr> = smartchr#one_of('=', ' = ', ' == ')
"inoremap <expr> ( smartchr#one_of('(', '()<LEFT>')
"inoremap <expr> { smartchr#one_of('{', '{}<LEFT>')
"inoremap <expr> [ smartchr#one_of('[', '[]<LEFT>')
"inoremap <expr> " smartchr#one_of('"', '""<LEFT>')
"}}}


" Vomodoro "{{{
"----------------------------------------------------
let g:Pomo_ToDoTodayFilePath = expand("$HOME") . '/.vomodoro/todotoday'
let g:Pomo_ArchiveFilePath = expand("$HOME") . '/.vomodoro/archive'
"}}}


" accelerated_jk "{{{
"----------------------------------------------------
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"}}}


" lightline "{{{
"----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }
"}}}


" gauref "{{{
"----------------------------------------------------
let g:gauref_file = $HOME.'/.vim/bundle/automatic/gauref.vim/doc/gauche-refj.txt'
"}}}


" gitgutter "{{{
"----------------------------------------------------

augroup MyGitgutter "{{{
    autocmd!
    autocmd FileType * hi SignColumn ctermbg=234
    autocmd FileType * hi GitGutterAddDefault ctermbg=234
    autocmd FileType * hi GitGutterChangeDefault ctermbg=234
    autocmd FileType * hi GitGutterDeleteDefault ctermbg=234
    autocmd FileType * hi GitGutterChangeDeleteDefault ctermbg=234
augroup END"}}}


"}}}

let g:metarw_gist_user = 'ryotakato'
let g:metarw_gist_token = '2f009e1a2f1893e3623468d2b844fad85767d923'

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
let g:neocomplete#sources#omni#functions.javascript = ['nodejscomplete#CompleteJS']
let g:node_usejscomplete = 0

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
set clipboard+=unnamed,autoselect

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

" vim scouter "{{{
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
"}}}


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


command! -bar RestartWithSession
\   let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
\   | Restart

if has('gui_macvim') && has('kaoriya')
  let s:ruby_libdir = system("ruby -rrbconfig -e 'print RbConfig::CONFIG[\"libdir\"]'")
  let s:ruby_libruby = s:ruby_libdir . '/libruby.dylib'
  if filereadable(s:ruby_libruby)
    let $RUBY_DLL = s:ruby_libruby
  endif
endif

