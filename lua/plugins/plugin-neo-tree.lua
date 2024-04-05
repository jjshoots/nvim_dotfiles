local function config_function()
	-- highlight group for neotree specifically
	vim.cmd([[
    hi NeoTreeNormal ctermbg=NONE guibg=NONE
    hi NeoTreeFloatNormal ctermbg=NONE guibg=NONE
    hi NeoTreeTitleBar ctermbg=NONE guibg=NONE
    hi NeoTreeFloatTitle ctermbg=NONE guibg=NONE
    hi NeoTreeEndOfBuffer ctermbg=NONE guibg=NONE
  ]])

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
