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
})

-- mapping
vim.api.nvim_set_keymap("n", "<C-e>", ":Neotree position=float toggle<CR>", { noremap = true, silent = true })
