local function config_function()
	-- highlight group for neotree specifically
	vim.cmd([[
    hi link NeoTreeNormal Normal
    hi link NeoTreeFloatNormal Normal
    hi link NeoTreeTitleBar Title
    hi link NeoTreeFloatTitle FloatBorder
    hi link NeotreeFloatBorder FloatBorder
    hi link NeoTreeEndOfBuffer EndOfBuffer
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
