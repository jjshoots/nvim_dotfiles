local function config_function()
	require("aerial").setup({})
	require("telescope").setup({
		extensions = {
			aerial = {
				-- Display symbols as <root>.<parent>.<symbol>
				show_nesting = {
					["_"] = true, -- This key will be the default
				},
				-- Available modes: symbols, lines, both
				show_columns = "both",
				format_symbol = function(symbol_path, filetype)
          -- handle json and yaml specially
          if filetype == "json" or filetype == "yaml" then
            return table.concat(symbol_path, ".")
          end

          -- everything else
          if #symbol_path == 1 then
            return symbol_path[#symbol_path]
          else
            return string.rep(" ", #symbol_path - 1) .. "." .. symbol_path[#symbol_path]
          end
				end,
			},
		},
	})
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
