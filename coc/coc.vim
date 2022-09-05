function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc smartf integration
nmap <leader>f <Plug>(coc-smartf-forward)
nmap <leader>F <Plug>(coc-smartf-backward)
nmap <silent> <A-[> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-]> <Plug>(coc-diagnostic-next)

augroup Smartf
  au User SmartfEnter :hi Conceal ctermfg=220 guifg=#FF0000
  au User SmartfLeave :hi Conceal ctermfg=239 guifg=#FFFFFF
augroup end
