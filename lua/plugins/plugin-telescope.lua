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
					["<Tab>"] = "select_vertical",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<M-p>"] = "close",
					["<M-q>"] = "close",
					["<M-u>"] = "close",
					["<M-t>"] = "close",
				},
				n = {
					["<Tab>"] = "select_vertical",
					["<M-p>"] = "close",
					["<M-q>"] = "close",
					["<M-u>"] = "close",
					["<M-t>"] = "close",
					["q"] = "close",
				},
			},
			file_ignore_patterns = {
				"venv/",
				"__pycache__",
			},
		},
	})

	-- buffer picker and deleter
	vim.keymap.set("n", "<M-b>", function()
		require("telescope.builtin").buffers({
			initial_mode = "insert",
			attach_mappings = function(prompt_bufnr, map)
				local delete_buf = function()
					local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
					current_picker:delete_selection(function(selection)
						vim.api.nvim_buf_delete(selection.bufnr, { force = true })
					end)
				end

				map("i", "<C-d>", delete_buf)
				map("n", "<C-d>", delete_buf)

				return true
			end,
		}, {
			sort_lastused = true,
			sort_mru = true,
			theme = "dropdown",
		})
	end)
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
		{ "<M-b>" },
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
