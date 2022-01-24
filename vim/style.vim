" I mean...
syntax on

" colorscheme
let g:sonokai_style = 'default'
colo sonokai
hi CursorLine guibg=#343330
hi Visual guibg=#6A2D21 gui=none
hi IncSearch cterm=NONE ctermfg=yellow ctermbg=green

hi Normal ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE
hi FoldColumn guibg=#2C3245 guifg=NONE
hi clear SignColumn

" highlight concealed blocks for tex
hi Conceal ctermfg=170 guifg=#9C4791 ctermbg=NONE guibg=NONE

" don't highlight whitespace errors
let g:python_highlight_space_errors = 0

" for highlight word under cursor and twins
hi CurrentWordTwins guibg=#313E42
hi CurrentWord guibg=#313E42

" floaterm
let g:floaterm_width = 0.6
let g:floaterm_height = 1.0
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'right'
let g:floaterm_title = 'Terminal $1|$2'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_autoinsert = v:true
hi Floaterm guibg=NONE
hi FloatermBorder guibg=#303035

" rainbow parentheses
let g:rainbow_active = 1

" disable git gutter mappings
let g:gitgutter_map_keys = v:false

" for latex previewing
let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 0
