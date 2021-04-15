source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/set.vim
source $HOME/.config/nvim/plug-config/map.vim
" source $HOME/.config/nvim/plug-config/python.vim
syntax on

call plug#begin('~/.vim/plugged')

" Edge colorscheme
Plug 'sainnhe/edge'
" Plug 'tanvirtin/monokai.nvim'

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

" undotree
Plug 'mbbill/undotree'

" rainbow brackets
Plug 'frazrepo/vim-rainbow'

" gitgutter integration
Plug 'airblade/vim-gitgutter'

" treesitter
" Plug 'nvim-treesitter/nvim-treesitter'
" use semshi for now
Plug 'numirias/semshi'

" polyglot for nicer syntax support
Plug 'sheerun/vim-polyglot'

" devicons
Plug 'ryanoasis/vim-devicons'

" highlight matching word under cursor
Plug 'dominikduda/vim_current_word'

" smart python folding
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'

" latex live preview
Plug 'lervag/vimtex'

" vim multi cursor
Plug 'mg979/vim-visual-multi'
call plug#end()

" colorscheme
colorscheme edge
set cursorline

" rainbow parentheses
let g:rainbow_active = 1
let g:rainbow_guifgs = ['yellow', 'orange', 'pink', 'lightblue']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
hi Visual guibg=#6A2D21  gui=none

" for visual multi remap
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-d>'

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

" for vimtex
let g:vimtex_view_general_viewer = 'brave-browser'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

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
