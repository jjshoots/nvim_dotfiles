-- highlight group for neotree specifically
vim.cmd [[
  hi NeoTreeNormal ctermbg=NONE guibg=NONE
  hi NeoTreeFloatNormal ctermbg=NONE guibg=NONE
  hi NeoTreeTitleBar ctermbg=NONE guibg=NONE
  hi NeoTreeFloatTitle ctermbg=NONE guibg=NONE
  hi NeoTreeFloatBorder ctermbg=NONE guibg=NONE
  hi NeoTreeEndOfBuffer ctermbg=NONE guibg=NONE
]]

-- setup with some options
require("neo-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 50,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
  popup_border_style = "rounded"
})

-- mapping
vim.api.nvim_set_keymap("n", "<C-e>", ":Neotree position=float toggle<CR>", { noremap = true, silent = true })
