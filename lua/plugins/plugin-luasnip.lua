local function config_function()
	require("luasnip").config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
	})
	require("luasnip.loaders.from_vscode").lazy_load()

	-- Expand or jump to the next snippet placeholder
	vim.api.nvim_set_keymap(
		"i",
		"<C-l>",
		'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"',
		{ expr = true, silent = true }
	)
	-- Jump to the previous snippet placeholder
	vim.api.nvim_set_keymap(
		"i",
		"<C-h>",
		'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<S-Tab>"',
		{ expr = true, silent = true }
	)
end

return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
	},
	build = "make install_jsregexp",
	config = config_function,
	event = "LspAttach",
}
