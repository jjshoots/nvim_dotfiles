local function config_function()
	require("aerial").setup({})
	require("telescope").load_extension("aerial")
end

return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = config_function,
	event = "LspAttach",
	keys = {
		{ "<M-t>", "<cmd>Telescope aerial<cr>", mode = "n", noremap = true, silent = true },
		{ "{", "<cmd>AerialPrev<cr>", mode = "n", noremap = true, silent = true },
		{ "}", "<cmd>AerialNext<cr>", mode = "n", noremap = true, silent = true },
	},
}
