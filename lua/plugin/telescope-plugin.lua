vim.api.nvim_set_keymap("n", "<M-p>", ":Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope find_files hidden=true no_ignore=true<CR>", {})
vim.api.nvim_set_keymap("n", "<M-q>", ":Telescope live_grep<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>q", ":Telescope live_grep hidden=true no_ignore=true<CR>", {})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<M-p>"] = "close",
				["<M-l>"] = "close",
				["<M-t>"] = "close",
			},
		},
		file_ignore_patterns = {
			"venv/",
			"__pycache__",
		},
	},
})
