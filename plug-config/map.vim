" leaderkey
let mapleader = " "

" window management
noremap <C-e> :NERDTreeToggle<CR>
noremap <C-z> :UndotreeToggle<CR>
noremap <C-Left> 5<C-w><
noremap <C-Right> 5<C-w>>
noremap <C-Up> 5<C-w>-
noremap <C-Down> 5<C-w>+
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" some easier motions
noremap <C-h> b
noremap <C-l> w
noremap <C-k> 3k
noremap <C-j> 3j

" ctrl w and ctrl e to do C-BS and C-DEL stuff
inoremap <C-e> <C-o>de
inoremap <C-w> <C-\><C-o>dB

" mapping for comment
map <C-_> gcc 

" cheaty cut command
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
vnoremap D "_D
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap <C-x> yydd
vnoremap <C-x> ygvd

" for indenting in visual mode
vnoremap > >gv
vnoremap < <gv

" next and previous buffer
nnoremap <leader>i :bn<CR>
nnoremap <leader>u :bp<CR>

" honestly this is the better save
nnoremap <C-s> :w<CR>
