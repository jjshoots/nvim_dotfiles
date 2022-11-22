-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  hijack_netrw = false,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<C-e>", action = "close" }
      }
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- mapping
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap=true, silent = true})
