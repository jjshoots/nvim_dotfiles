vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-smartf-forward)', {})
vim.api.nvim_set_keymap('n', '<leader>F', '<Plug>(coc-smartf-backward)', {})
-- vim.api.nvim_set_keymap('n', ';', '<Plug>(coc-smartf-repeat)', {})
-- vim.api.nvim_set_keymap('n', ',', '<Plug>(coc-smartf-repeat-opposite)', {})

vim.api.nvim_command([[
  augroup Smartf
    autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#FF0000
    autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#FF0000
  augroup end
]])

-- lua versions for 0.7+
-- local group = vim.api.nvim_create_augroup("Smartf", { clear = true })
-- vim.api.nvim_create_autocmd("User SmartfEnter", { command = ":hi Conceal ctermfg=220 guigh=#FF0000", group = group })
-- vim.api.nvim_create_autocmd("User SmartfLeave", { command = ":hi Conceal ctermfg=239 guigh=#FF0000", group = group })
