" leaderkey
let mapleader = " "

" disable some stupid things
nnoremap <backspace> <nop>
nnoremap <space> <nop>
nnoremap <CR> <nop>
nnoremap <Tab> <nop>

" disable scrolling, use the mouse
nnoremap <C-u> <nop>
nnoremap <C-d> <nop>

" nohl toggle
noremap <silent> <leader>s :set hlsearch! hlsearch?<CR>

" window management
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

" mapping for macro repeat
nnoremap m @q

" mapping for replace from clipboard
nnoremap <C-p> "_diwP

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
vnoremap <silent> J :m '>+1<CR>gv
vnoremap <silent> K :m '<-2<CR>gv

" next and previous tab and buffer
nnoremap <silent> <leader>o :bnext<CR>
nnoremap <silent> <leader>i :bprevious<CR>
nnoremap <silent> <Tab>o :tabnext<CR>
nnoremap <silent> <Tab>i :tabprevious<CR>

" remap previous and next positions
nnoremap <C-o> <C-i>
nnoremap <C-i> <C-o>

" honestly this is the better save
nnoremap <silent> <C-s> :w!<CR>

" remap for quickly grabbing word under cursor and
" applying to search without moving
nnoremap <A-y> *N
vnoremap <A-y> y?<C-R>+<CR>N/<Esc>gv

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

" mapping for deleting a word in forward mode, equivalent to Ctrl-Del
inoremap <C-e> <C-o>dw

" open a new tab, rename it, and start a terminal in insert mode
fun! s:OpenTerminalTab()
  tabnew
  terminal
  startinsert
endfunction

" tab management
nnoremap <silent> <leader>t :call <SID>OpenTerminalTab()<CR>
nnoremap <silent> <C-t> :tabnew<CR>:Telescope find_files<CR>

" for quickly jumping to the n-th buffer
nnoremap <silent> <leader>1 :LualineBuffersJump 1<CR>
nnoremap <silent> <leader>2 :LualineBuffersJump 2<CR>
nnoremap <silent> <leader>3 :LualineBuffersJump 3<CR>
nnoremap <silent> <leader>4 :LualineBuffersJump 4<CR>
nnoremap <silent> <leader>5 :LualineBuffersJump 5<CR>
nnoremap <silent> <leader>6 :LualineBuffersJump 6<CR>
nnoremap <silent> <leader>7 :LualineBuffersJump 7<CR>
nnoremap <silent> <leader>8 :LualineBuffersJump 8<CR>
nnoremap <silent> <leader>9 :LualineBuffersJump 9<CR>

" for quickly jumping to the n-th tab
nnoremap <silent> <Tab>1 :tabn 1<CR>
nnoremap <silent> <Tab>2 :tabn 2<CR>
nnoremap <silent> <Tab>3 :tabn 3<CR>
nnoremap <silent> <Tab>4 :tabn 4<CR>
nnoremap <silent> <Tab>5 :tabn 5<CR>
nnoremap <silent> <Tab>6 :tabn 6<CR>
nnoremap <silent> <Tab>7 :tabn 7<CR>
nnoremap <silent> <Tab>8 :tabn 8<CR>
nnoremap <silent> <Tab>9 :tabn 9<CR>

" remove from quickfix list (x for quickfiX)
" remove all files
nnoremap <silent> <C-q>d :cexpr filter(getqflist(), {_, v -> v.bufnr != bufnr('%')})<CR>
" next item
nnoremap <silent> <C-q>n :cnext<CR>
nnoremap <silent> <C-q>j :cnext<CR>
" previous item
nnoremap <silent> <C-q>p :cprev<CR>
nnoremap <silent> <C-q>k :cprev<CR>

" close buffers or quit nvim
fun! s:CloseBuffersOrQuit()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
    execute ':bd'
  else
    qall!
  endif
endfunction
nnoremap <silent> <C-d> :call <SID>CloseBuffersOrQuit()<CR>

" close tabs or quit nvim
fun! s:CloseTabsOrQuit()
  if tabpagenr('$') > 1
    execute ':tabclose'
  else
    qall!
  endif
endfunction
nnoremap <silent> <Tab>q :call <SID>CloseTabsOrQuit()<CR>
