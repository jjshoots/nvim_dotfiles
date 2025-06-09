local function config_function()
	-- highlight group for neotree specifically
	vim.cmd([[
    hi! link NeoTreeNormal Normal
    hi! link NeoTreeFloatNormal Normal
    hi! link NeoTreeTitleBar Title
    hi! link NeoTreeFloatTitle FloatBorder
    hi! link NeotreeFloatBorder FloatBorder
    hi! link NeoTreeEndOfBuffer EndOfBuffer
  ]])

	local function yank_filepath(state)
		-- yanks the full filepath of the current file
		local node = state.tree:get_node() -- Get the current node
		local path = node.path -- Extract the file path

		if path then
			vim.fn.setreg("+", path) -- Copy to system clipboard
			vim.notify("File path copied: " .. path, vim.log.levels.INFO) -- Notify user
		end
	end

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
		window = {
			mappings = {
				["<S-CR>"] = "open_vsplit",
				["<C-CR>"] = "open_split",
				["<M-CR>"] = "open_tabnew",
				["<C-y>"] = yank_filepath,
			},
		},
	})
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = config_function,
	keys = {
		{ "<C-e>", "<cmd>Neotree position=float toggle<cr>", mode = "n", noremap = true, silent = true },
	},
}
