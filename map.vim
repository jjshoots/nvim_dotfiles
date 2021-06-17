" disable some stupid things
nnoremap <backspace> <nop>
nnoremap <space> <nop>
nnoremap <CR> <nop>
" disable scrolling, use the mouse
nnoremap <C-u> <nop>
nnoremap <C-d> <nop>

" leaderkey
let mapleader = " "

" window management
nmap <C-e> :NERDTreeToggle<CR>
nmap <silent> <C-P> :Files<CR>
noremap <silent> <C-z> :UndotreeToggle<CR>
noremap <silent> <C-Left> 5<C-w><
noremap <silent> <C-Right> 5<C-w>>
noremap <silent> <C-Up> 5<C-w>-
noremap <silent> <C-Down> 5<C-w>+
noremap <silent> <leader>h <C-w>h
noremap <silent> <leader>j <C-w>j
noremap <silent> <leader>k <C-w>k
noremap <silent> <leader>l <C-w>l

" some easier motions
noremap <C-h> b
noremap <C-l> w
noremap <C-k> 3k
noremap <C-j> 3j
noremap <C-m> $
noremap <C-n> ^

" ctrl w and ctrl e to do C-BS and C-DEL stuff
inoremap <C-e> <C-o>de
inoremap <C-w> <C-\><C-o>db

" mapping for comment
vmap <C-_> gcgv
nmap <C-_> gcc
imap <C-_> <Esc>gcci

" mapping for macro repeat
nnoremap m @q

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
nnoremap <leader>o :bn<CR>
nnoremap <leader>i :bp<CR>

" remap previous and next positions
nnoremap <C-o> <C-i>
nnoremap <C-i> <C-o>

" honestly this is the better save
nnoremap <C-s> :w<CR>

" create session
nnoremap <C-w> :mks!<CR>

" remap for quickly grabbing word under cursor and
" applying to search without moving
nnoremap <C-f> *N
vnoremap <C-f> y?<C-R>+<CR>N/<Esc>gv

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
tnoremap <Esc> <C-\><C-n>

" fugitive
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

function! ToggleGStatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    vertical Git
    vertical resize 45
  endif
endfunction
command! ToggleGStatus :call ToggleGStatus()

nnoremap <A-f> :ToggleGStatus<CR>

" coc smartf integration
nmap <leader>f <Plug>(coc-smartf-forward)
nmap <leader>F <Plug>(coc-smartf-backward)
nmap <silent> <A-[> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-]> <Plug>(coc-diagnostic-next)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#FF0000
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#FFFFFF
augroup end

