" I mean...
syntax on

" colorscheme
let g:sonokai_style = 'default'
colo sonokai
hi CursorLine guibg=#343330
hi Visual guibg=#6A2D21 gui=none
hi IncSearch cterm=NONE ctermfg=yellow ctermbg=green

" transparent all the things
hi Normal ctermbg=NONE guibg=NONE
hi NormalNC ctermbg=NONE guibg=NONE
hi NormalSB ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE

hi FoldColumn guibg=#2C3245 guifg=NONE
hi clear SignColumn

" highlight concealed blocks for tex
hi Conceal ctermfg=170 guifg=#9C4791 ctermbg=NONE guibg=NONE

" change highlight for split indicator
hi VertSplit guifg=#9E4447

" highlight word under cursor
hi CursorWord guibg=#313E42
