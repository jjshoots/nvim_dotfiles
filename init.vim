source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/set.vim
source $HOME/.config/nvim/map.vim
syntax on

call plug#begin('~/.vim/plugged')

" Edge colorscheme
Plug 'jjshoots/edge-jet'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" brackets
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" vim airline
Plug 'vim-airline/vim-airline'

" vim fugitive
Plug 'tpope/vim-fugitive'

" smart commenting
Plug 'tpope/vim-commentary'

" devicons for file explorer
Plug 'ryanoasis/vim-devicons'

" undotreevim terminal function not working with buffers
Plug 'mbbill/undotree'

" rainbow brackets
Plug 'luochen1990/rainbow'

" gitgutter integration
Plug 'airblade/vim-gitgutter'

" treesitter
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'numirias/semshi'

" polyglot for nicer syntax support
Plug 'sheerun/vim-polyglot'

" devicons
Plug 'ryanoasis/vim-devicons'

" highlight matching word under cursor
Plug 'dominikduda/vim_current_word'

" for nice scrolling
Plug 'psliwka/vim-smoothie'

" floating terminal
Plug 'voldikss/vim-floaterm'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'coreyja/fzf.devicon.vim'

" nerdtree
Plug 'preservim/nerdtree'

call plug#end()

" colorscheme
set termguicolors
let g:sonokai_style = 'default'
colo sonokai
hi CursorLine guibg=#403D34
hi Visual guibg=#6A2D21  gui=none
hi IncSearch cterm=NONE ctermfg=yellow ctermbg=green

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

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
let g:floaterm_borderchars = '─│─│┌┐┘└'
let g:floaterm_autoinsert = v:true
" hi Floaterm guibg=#2d2d31
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
" let g:airline#extensions#tabline#left_sep = '◤'
let g:airline#extensions#tabline#left_alt_sep = '｜'
" let g:airline_right_sep= '◢'
" let g:airline_left_sep= '◣'
let g:airline_skip_empty_sections = 1

" fzf settings
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --margin=1,4"

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

" functions here

" do some stuff on window focus
augroup FocusWindows
  au!
  au VimEnter * call OnEnter()
  au BufWinEnter * call OnEnter()
  au WinEnter * call OnEnter()

  au WinLeave * call OnLeave()

  au VimResized * call Readjust()

augroup END

fun! OnEnter()
  if &buftype != 'nowrite'
    if &modifiable
      setlocal cursorline
      setlocal signcolumn=auto
      setlocal relativenumber
      setlocal winwidth=90
    endif
  endif
endfun

fun! OnLeave()
  if &buftype != 'nowrite'
    if &modifiable
      setlocal nocursorline
      setlocal signcolumn=no
      setlocal norelativenumber
      setlocal wrap
      setlocal nowrap
    endif
  endif
endfun

" don't move mouse on screen refocus
augroup CursorIgnoreOnFocus
  au!
  au FocusLost * let g:oldmouse=&mouse | set mouse=
  au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

" trim whitespace on save
augroup FileStuff
  au!
  au BufWritePre * call TrimWhitespace()
  au BufNewFile,BufRead *.world set syntax=xml
augroup END

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
