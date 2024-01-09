require('betterf')
vim.api.nvim_command("highlight betterFHighlightGroup guifg=#ff0000")
vim.api.nvim_set_keymap('n', '<Leader>f', [[:lua betterF(true)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>F', [[:lua betterF(false)<CR>]], { noremap = true, silent = true })
