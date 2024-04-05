local function config_function()
	require("aerial").setup({
		-- optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })

			-- Open telescope tag view
			vim.keymap.set("n", "<M-t>", "<cmd>Telescope aerial<cr>")
		end,
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
}
