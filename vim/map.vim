" disable some stupid things
nnoremap <backspace> <nop>
nnoremap <space> <nop>
nnoremap <CR> <nop>
"
" disable scrolling, use the mouse
nnoremap <C-u> <nop>
nnoremap <C-d> <nop>

" leaderkey
let mapleader = " "

" nohl toggle
:noremap <leader>s :set hlsearch! hlsearch?<CR>

" window management
nmap <silent> <C-e> :NERDTreeToggle<CR>
nmap <silent> <C-p> <cmd>:Telescope find_files<CR>
noremap <silent> <C-z> :UndotreeToggle<CR>
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
noremap <C-m> $
noremap <C-n> ^

" use to move around in autocompletion menu
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" ctrl w and ctrl e to do C-BS and C-DEL stuff
inoremap <C-e> <C-o>de
inoremap <C-w> <C-\><C-o>db

" mapping for comment
vmap <C-_> gcgv
nmap <C-_> gcc
imap <C-_> <Esc>gcci

" mapping for macro repeat
nnoremap m @q

" mapping for replace from clipboard
nnoremap <M-p> "_diwP

" remap the buffer
nnoremap d "_d
nnoremap D "_D
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C
xnoremap d "_d
xnoremap D "_D
xnoremap x "_x
xnoremap X "_X
xnoremap c "_c
xnoremap C "_C
xnoremap p "_dp
xnoremap P "_dP
nnoremap <A-d> yydd
vnoremap <A-d> ygvd

" for indenting in visual mode
vnoremap > >gv
vnoremap < <gv

" move section up and down HEK YES
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

" next and previous buffer
nnoremap <silent> <leader>o :bn<CR>
nnoremap <silent> <leader>i :bp<CR>

" remap previous and next positions
nnoremap <C-o> <C-i>
nnoremap <C-i> <C-o>

" honestly this is the better save
nnoremap <C-s> :w<CR>

" create session
nnoremap <C-d> :mks!<CR>

" remap for quickly grabbing word under cursor and
" applying to search without moving
nnoremap <A-e> *N
vnoremap <A-e> y?<C-R>+<CR>N/<Esc>gv

" mapping for folding
nnoremap <leader>z za

" move down a line, display or not, when I say so
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
noremap <silent> 0 g0
noremap <silent> $ g$

" quick new section / position
nnoremap <A-o> o<Esc>O
nnoremap <A-i> i<space>

" floaterm map
nnoremap <silent> <A-j> :FloatermToggle<CR>
tnoremap <silent> <A-j> <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>4 :FloatermKill<CR>:FloatermToggle<CR>
nnoremap <silent> <leader>5 :FloatermNew<CR>
nnoremap <silent> <leader>8 :FloatermPrev<CR>
nnoremap <silent> <leader>9 :FloatermNext<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" fugitive
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
vmap <silent> u <esc>:Gdiff<cr>gv:diffget<cr><c-w><c-w>ZZ

fun! ToggleGStatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    vertical Git
    vertical resize 70
  endif
endfun
command! ToggleGStatus :call ToggleGStatus()

nnoremap <A-f> :ToggleGStatus<CR>
