local function config_function()
  require'luasnip'.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
  }
  require("luasnip.loaders.from_vscode").lazy_load()

  -- Expand or jump to the next snippet placeholder
  vim.api.nvim_set_keymap('i', '<C-m>', 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', {expr = true, silent = true})
  -- Jump to the previous snippet placeholder
  vim.api.nvim_set_keymap('i', '<C-n>', 'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<S-Tab>"', {expr = true, silent = true})
end

return {
  "L3MON4D3/LuaSnip",
	dependencies = {
    "rafamadriz/friendly-snippets",
	},
  build = "make install_jsregexp",
	config = config_function,
	event = "LspAttach",
}
