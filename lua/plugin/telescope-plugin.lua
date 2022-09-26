vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {})

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  }
}
