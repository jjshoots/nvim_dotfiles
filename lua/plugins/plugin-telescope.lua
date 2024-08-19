local function config_function()
	-- highlight
	vim.cmd([[
      highlight link TelescopeBorder FloatBorder
    ]])

	-- telescope itself
	require("telescope").setup({
		defaults = {
			layout_config = {
				width = 0.92,
				height = 0.96,
			},
			mappings = {
				i = {
					["<S-CR>"] = "select_vertical",
					["<C-CR>"] = "select_horizontal",
					["<M-CR>"] = "select_tab",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<M-p>"] = "close",
					["<M-q>"] = "close",
					["<M-u>"] = "close",
					["<M-t>"] = "close",
					["<C-y>"] = function()
						local entry = require("telescope.actions.state").get_selected_entry()
						local cb_opts = vim.opt.clipboard:get()
						if vim.tbl_contains(cb_opts, "unnamed") then
							vim.fn.setreg("*", entry.path)
						end
						if vim.tbl_contains(cb_opts, "unnamedplus") then
							vim.fn.setreg("+", entry.path)
						end
						vim.fn.setreg("", entry.path)
					end,
				},
				n = {
					["<S-CR>"] = "select_vertical",
					["<C-CR>"] = "select_horizontal",
					["<M-CR>"] = "select_tab",
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
