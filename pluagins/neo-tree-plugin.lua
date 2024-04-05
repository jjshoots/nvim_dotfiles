-- mapping
vim.api.nvim_set_keymap("n", "<C-e>", ":Neotree position=float toggle<CR>", { noremap = true, silent = true })

-- highlight group for neotree specifically
vim.cmd("hi NeoTreeNormal ctermbg=NONE guibg=NONE")
vim.cmd("hi NeoTreeFloatNormal ctermbg=NONE guibg=NONE")
vim.cmd("hi NeoTreeTitleBar ctermbg=NONE guibg=NONE")
vim.cmd("hi NeoTreeFloatTitle ctermbg=NONE guibg=NONE")
vim.cmd("hi NeoTreeEndOfBuffer ctermbg=NONE guibg=NONE")

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
	popup_border_style = "rounded",
})
