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
inoremap <C-w> <C-\><C-o>db

" mapping for comment
vmap <C-_> gcgv
nmap <C-_> gcc
imap <C-_> <Esc>gcci

" remap the buffer
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
vnoremap D "_D
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap C "_C
vnoremap i "_i
vnoremap I "_I
vnoremap p "_p
vnoremap P "_P
nnoremap <A-d> yydd
vnoremap <A-d> ygvd

" remap p to P
noremap p P
noremap P p

" for indenting in visual mode
vnoremap > >gv
vnoremap < <gv

" next and previous buffer
nnoremap <leader>o :bn<CR>
nnoremap <leader>i :bp<CR>

" remap previous and next positions
nnoremap <C-o> <C-i>
nnoremap <C-i> <C-o>

" honestly this is the better save
nnoremap <C-s> :w<CR>

" remap for quickly grabbing word under cursor and
" applying to search without moving
nnoremap <C-n> *N
vnoremap <C-n> y?<C-R>+<CR>N/<Esc>gv

" move down a line, display or not, when I say so
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
noremap <silent> 0 g0
noremap <silent> $ g$

" quick new section / position
nnoremap <M-o> o<Esc>O
nnoremap <M-a> i<space>

" floaterm map
nnoremap <silent> <A-j> :FloatermToggle<CR>
tnoremap <silent> <A-j> <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>4 :FloatermKill<CR>:FloatermToggle<CR>
nnoremap <silent> <leader>5 :FloatermNew<CR>
nnoremap <silent> <leader>8 :FloatermPrev<CR>
nnoremap <silent> <leader>9 :FloatermNext<CR>
tnoremap <Esc> <C-\><C-n>

" fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>:resize 10<CR>

" disable some stupid things
nnoremap <backspace> <nop>
nnoremap <space> <nop>
nnoremap <CR> <nop>
