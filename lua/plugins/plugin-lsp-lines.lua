local function config_function()
	require("lsp_lines").setup()
	vim.diagnostic.config({
		-- NOTE: Enable plugin
		virtual_lines = true,
		-- NOTE: Disable default regular virtual text diagnostics.
		virtual_text = false,
		vim.keymap.set(
		  "n",
		  "<Leader>u",
		  require("lsp_lines").toggle,
		  { desc = "Toggle lsp_lines" },
		),
	})
end

return {
	"maan2003/lsp_lines.nvim",
	config = config_function,
	keys = {
		"<leader>u",
	},
}
