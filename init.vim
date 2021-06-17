source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/set.vim
source $HOME/.config/nvim/map.vim
syntax on

call plug#begin('~/.vim/plugged')

" Edge colorscheme
Plug 'jjshoots/edge-jet'
Plug 'morhetz/gruvbox'

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
let g:floaterm_width = 0.5
let g:floaterm_height = 1.0
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'right'
let g:floaterm_title = 'Terminal $1|$2'
let g:floaterm_borderchars = '        '
let g:floaterm_autoinsert = v:true
hi Floaterm guibg=#2d2d31
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
let g:airline#extensions#tabline#left_sep = '◤'
let g:airline#extensions#tabline#left_alt_sep = '｜'
let g:airline_skip_empty_sections = 1

" fzf settings
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --margin=1,4"

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
  autocmd BufNewFile,BufRead *.world set syntax=xml
augroup END

