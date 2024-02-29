" do some stuff on window focus
augroup FocusWindows
  au!
  au VimEnter * call OnEnter()
  au BufWinEnter * call OnEnter()
  au WinEnter * call OnEnter()

  au WinLeave * call OnLeave()
augroup END

fun! OnEnter()
  if &buftype != 'nowrite'
        \ && &buftype != 'nofile'
        \ && &buftype != 'terminal'
        \ && &buftype != 'prompt'
        \ && &buftype != 'quickfix'
    if &modifiable
      " setlocal winwidth=90
      setlocal cursorline
      setlocal signcolumn=auto
      setlocal relativenumber
      setlocal foldcolumn=1
    endif

    if &filetype == 'tex'
        \ || &filetype == 'md'
      setlocal wrap
    endif
  endif
endfun

fun! OnLeave()
  if &buftype != 'nowrite'
        \ && &buftype != 'nofile'
        \ && &buftype != 'terminal'
        \ && &buftype != 'prompt'
        \ && &buftype != 'quickfix'
    if &modifiable
      setlocal nocursorline
      setlocal signcolumn=no
      setlocal norelativenumber
      setlocal wrap
      setlocal nowrap
      setlocal foldcolumn=0
    endif
  endif
endfun

" don't move mouse on screen refocus
augroup CursorIgnoreOnFocus
  au!
  au FocusLost * let g:oldmouse=&mouse | set mouse=
  au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

" trim whitespace on save
augroup FileStuff
  au!
  au BufWritePre * call TrimWhitespace()
  au BufNewFile,BufRead *.world set syntax=xml
augroup END

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" for md and tex autowrap
augroup AutoWrap
  au!
  au FileType tex setlocal wrap
  au FileType markdown setlocal wrap
augroup end

" for md and tex preview
augroup PreviewWindow
  au!
  au FileType tex nnoremap <leader>v :LLPStartPreview<CR>
  au FileType markdown nnoremap <leader>v :CocCommand markdown-preview-enhanced.openPreview<CR>
augroup end

" automatically open telescope if no files opened on commandline
augroup AutoTelescope
  au!
  au VimEnter * call TelescopeFindFiles()
augroup end

fun! TelescopeFindFiles()
  " echo 'v:argv = ' . join(v:argv, ', ')
  if len(v:argv) == 2
    Telescope find_files
  endif
endfun
