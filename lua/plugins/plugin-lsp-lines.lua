local function config_function()
	vim.cmd([[
    hi DiagnosticError guifg=#DA4A4A guibg=#2C202B
    hi DiagnosticWarn guifg=#E1AE68 guibg=#4A4137
    hi DiagnosticInfo guifg=#1B937E guibg=#1b2b33
    hi DiagnosticHint guifg=#088F8F guibg=#023020
    hi link DiagnosticVirtualTextError DiagnosticError
    hi link DiagnosticVirtualTextWarn DiagnosticWarn
    hi link DiagnosticVirtualTextInfo DiagnosticInfo
    hi link DiagnosticVirtualTextHint DiagnosticHint
  ]])

	require("lsp_lines").setup()
	vim.diagnostic.config({
		virtual_lines = true,
	})
	require("lsp_lines").toggle()
end

return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = config_function,
	keys = {
		{
			"<leader>U",
			function()
				require("lsp_lines").toggle()
			end,
			mode = "n",
			noremap = true,
			silent = true,
		},
	},
}
