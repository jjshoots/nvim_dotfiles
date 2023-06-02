-- change width
vim.g.tagbar_width = 100
-- autofocus
vim.g.tagbar_autofocus = 1
-- show linenumbers
vim.g.tagbar_show_tag_linenumbers = 2
-- don't sort
vim.g.tagbar_sort = 0

-- mappings
vim.api.nvim_set_keymap('n', '<A-t>', ':TagbarToggle<CR>', { noremap = true, silent = true})
