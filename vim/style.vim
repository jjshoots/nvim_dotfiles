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

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_alt_sep = '｜'
let g:airline_skip_empty_sections = 1
" let g:airline#extensions#tabline#left_sep = '◤'
" let g:airline_right_sep= '◢'
" let g:airline_left_sep= '◣'

" fzf settings
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --margin=1,4"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
