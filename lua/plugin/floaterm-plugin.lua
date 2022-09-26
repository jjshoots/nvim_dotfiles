vim.g.floaterm_width = 0.6
vim.g.floaterm_height = 0.9
vim.g.floaterm_wintype = 'float'
vim.g.floaterm_position = 'right'
vim.g.floaterm_title = 'Terminal $1|$2'
vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
vim.g.floaterm_autoinsert = false

-- colours
vim.api.nvim_set_hl(0, 'Floaterm', {})
vim.api.nvim_set_hl(0, 'FloatermBorder', { bg = "#303035" })

-- floaterm function with insert mode
function FloatermInsertEnter()
    vim.g.floaterm_autoinsert = true
    vim.cmd('FloatermToggle')
    vim.g.floaterm_autoinsert = false
end

-- mappings
vim.api.nvim_set_keymap('n', '<A-j>', ':lua FloatermInsertEnter()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':FloatermToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true})

