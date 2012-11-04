if has('gui_macvim')
  
    " transparency
    set transparency=10

    " not display toolbar
    set guioptions-=t
    " not display right scroll bar
    set guioptions-=r
    set guioptions-=R
    " not display left scroll bar
    set guioptions-=l
    set guioptions-=L
    " font
    set guifont=Osaka-Mono:h14
    " disabled IM
    set imdisable
    " fullscreen
    set fuoptions=maxvert,maxhorz
    autocmd GUIEnter * set fullscreen 

    " colorscheme
    colorscheme wombat256
    " setting for objective-c *.h 
    let g:c_syntax_for_h=1
endif
