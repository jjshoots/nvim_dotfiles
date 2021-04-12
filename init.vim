source $HOME/.config/nvim/plug-config/coc.vim

syntax on

set number
set nu
set nohlsearch
set hidden
set noerrorbells
set signcolumn

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set nobackup
set noswapfile
set undodir=~/.nvim/undodir
set undofile
set clipboard=unnamed

set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set cmdheight=2

call plug#begin('~/.vim/plugged')

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" brackets
Plug 'tpope/vim-surround'

" vim airline
Plug 'vim-airline/vim-airline'

" polyglot for nicer syntax support
Plug 'sheerun/vim-polyglot'

" vim fugitive
Plug 'tpope/vim-fugitive'

" file explorer
Plug 'preservim/nerdtree'

" devicons for file explorer
Plug 'ryanoasis/vim-devicons'

" undotree
Plug  'mbbill/undotree'

call plug#end()

" colorscheme
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" air-line
let g:airline_powerline_fonts = 1

" autocomplete brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <lt>><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" window management
noremap <C-E> :NERDTreeToggle<CR>
noremap <C-z> :UndotreeToggle<CR>
noremap <C-Left> 5<C-w><
noremap <C-Right> 5<C-w>>
noremap <C-Up> 5<C-w>-
noremap <C-Down> 5<C-w>+

" functions here
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup JET
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END




