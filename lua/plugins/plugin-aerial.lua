local function config_function()
	require("aerial").setup({})
	require("telescope").setup({
		extensions = {
			aerial = {
				-- Display symbols as <root>.<parent>.<symbol>
				show_nesting = {
					["_"] = true, -- This key will be the default
				},
				nesting_symbol = "│ ",
				nesting_symbol_length = 2,
				-- Available modes: symbols, lines, both
				show_columns = "both",
			},
		},
	})
	require("telescope").load_extension("aerial")
end

return {
	-- TODO: update this when https://github.com/stevearc/aerial.nvim/pull/395 gets merged
	"jjshoots/aerial.nvim",
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
