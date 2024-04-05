local function config_function()
	-- highlight
	vim.cmd([[
      highlight link TelescopeBorder FloatBorder
    ]])

	-- telescope itself
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
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = config_function,
	keys = {
		{ "<M-p>", "<cmd>Telescope find_files<cr>", mode = "n", noremap = true, silent = true },
		{ "<M-q>", "<cmd>Telescope live_grep<cr>", mode = "n", noremap = true, silent = true },
		{
			"<leader>p",
			"<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
			mode = "n",
			noremap = true,
			silent = true,
		},
		{
			"<leader>q",
			"<cmd>Telescope live_grep hidden=true no_ignore=true<cr>",
			mode = "n",
			noremap = true,
			silent = true,
		},
	},
}
