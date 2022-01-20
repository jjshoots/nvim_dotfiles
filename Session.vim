let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd init.vim
edit coc-settings.json
argglobal
balt coc/coc.vim
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 33 - ((32 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 025|
if exists(':tcd') == 2 | tcd ~/.config/nvim | endif
tabnext 1
badd +58 ~/.config/nvim/vim/plug.vim
badd +1 ~/.config/nvim/init.vim
badd +56 ~/.config/nvim/vim/set.vim
badd +7 ~/.config/nvim/lua/tele.lua
badd +1 ~/.config/nvim/vim/style.vim
badd +54 ~/.config/nvim/lua/lline.lua
badd +1 ~/.config/nvim/vim/map.vim
badd +62 ~/.config/nvim/vim/func.vim
badd +30 ~/.config/nvim/coc/coc.vim
badd +27 ~/.config/nvim/coc-settings.json
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=90 shortmess=filnxtToOFA
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
