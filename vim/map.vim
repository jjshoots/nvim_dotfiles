" disable some stupid things
nnoremap <backspace> <nop>
nnoremap <space> <nop>
nnoremap <CR> <nop>

" disable scrolling, use the mouse
nnoremap <C-u> <nop>
nnoremap <C-d> <nop>

" leaderkey
let mapleader = " "

" nohl toggle
noremap <leader>s :set hlsearch! hlsearch?<CR>

" window management
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

" mapping for comment
vmap <C-/> gcgv
nmap <C-/> gcc

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
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

" next and previous buffer
nnoremap <silent> <leader>o :bn<CR>
nnoremap <silent> <leader>i :bp<CR>

" remap previous and next positions
nnoremap <C-o> <C-i>
nnoremap <C-i> <C-o>

" honestly this is the better save
nnoremap <C-s> :w!<CR>

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

" for quickly jumping to the n-th buffer
nnoremap <leader>1 :LualineBuffersJump 1<CR>
nnoremap <leader>2 :LualineBuffersJump 2<CR>
nnoremap <leader>3 :LualineBuffersJump 3<CR>
nnoremap <leader>4 :LualineBuffersJump 4<CR>
nnoremap <leader>5 :LualineBuffersJump 5<CR>
nnoremap <leader>6 :LualineBuffersJump 6<CR>
nnoremap <leader>7 :LualineBuffersJump 7<CR>
nnoremap <leader>8 :LualineBuffersJump 8<CR>
nnoremap <leader>9 :LualineBuffersJump 9<CR>

" close buffers or quit nvim
fun! s:CloseBuffersOrQuit()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
    execute ':bd'
  else
    qall!
  endif
endfunction

" for closing buffers
nnoremap <C-d> :call <SID>CloseBuffersOrQuit()<CR>

" git status
fun! s:ToggleGstatus() abort
	for l:winnr in range(1, winnr('$'))
		if !empty(getwinvar(l:winnr, 'fugitive_status'))
			execute l:winnr.'close'
		else
      vertical Git
      vertical resize 70
		endif
	endfor
endfun

nnoremap <M-f> :call <SID>ToggleGstatus()<CR>4j

" map for closing diff view
command! -nargs=0 Diffquit normal! ZZ:Gedit<CR>
