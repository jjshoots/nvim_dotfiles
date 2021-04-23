source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/set.vim
source $HOME/.config/nvim/plug-config/map.vim
syntax on

call plug#begin('~/.vim/plugged')

" Edge colorscheme
Plug 'jjshoots/edge-jet'
Plug 'morhetz/gruvbox'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" brackets
Plug 'tpope/vim-surround'

" vim airline
Plug 'vim-airline/vim-airline'

" vim fugitive
Plug 'tpope/vim-fugitive'

" smart commenting
Plug 'tpope/vim-commentary'

" file explorer
Plug 'preservim/nerdtree'

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

call plug#end()

" colorscheme
colorscheme gruvbox
let g:gruvbox_italicize_strings = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_undercurl = 0
hi Visual guibg=#6A2D21  gui=none
hi CursorLine guibg=#403D34

" don't highlight whitespace errors
let g:python_highlight_space_errors = 0

" for highlight word under cursor and twins
hi CurrentWordTwins guibg=#313E42
hi CurrentWord guibg=#313E42

" floaterm
let g:floaterm_width = 1.0
let g:floaterm_autoinsert = v:false
let g:floaterm_position = 'bottom'
let g:floaterm_title = 'Terminal $1 of $2'
hi Floaterm guibg=#161B20
hi FloatermBorder guibg=#0E1034

" rainbow parentheses
let g:rainbow_active = 1

" airline buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" for nerdtree icons brackets
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" air-line
let g:airline_powerline_fonts = 1

" functions here
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" autohide cursorline
augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" don't move mouse on screen refocus
augroup CursorIgnoreOnFocus
  au!
  au FocusLost * let g:oldmouse=&mouse | set mouse=
  au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

" file stuff on open
augroup FileStuff
  au!
  " trim whitespaces
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

