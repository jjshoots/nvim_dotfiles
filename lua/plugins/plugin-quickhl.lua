local function config_function() end

return {
	"t9md/vim-quickhl",
	config = config_function,
	keys = {
		{ "<leader>m", "<Plug>(quickhl-manual-this)", mode = "n", noremap = true, silent = true },
		{ "<leader>M", "<Plug>(quickhl-manual-reset)", mode = "n", noremap = true, silent = true },
	},
}
