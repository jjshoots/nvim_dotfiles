source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/set.vim
source $HOME/.config/nvim/plug-config/map.vim
syntax on

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

" nice syntax highlighting
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

" colorscheme
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" rainbow parentheses
let g:rainbow_active = 1
let g:rainbow_guifgs = ['yellow', 'orange', 'red', 'lightblue']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" air-line
let g:airline_powerline_fonts = 1

" functions here
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

augroup JET
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufEnter * call SyncTree()
augroup END




