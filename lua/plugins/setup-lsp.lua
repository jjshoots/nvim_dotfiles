local function config_function()
	-- keybindings
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			local opts = { buffer = event.buf }

			-- keybindings
			vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<M-[>", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "<M-]>", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>u", vim.diagnostic.open_float)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<M-u>", require("telescope.builtin").diagnostics, opts)
			vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
			-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
			-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
			-- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			-- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
			-- vim.keymap.set({ "n", "x" }, "<F3>", function()
			-- 	vim.lsp.buf.format({ async = true })
			-- end, opts)

			-- disable inlay hints
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
				})
		end,
	})

	-- I have no idea what these lines are doing
	-- update capabilities with nvim cmp
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	-- setup the servers
	require("mason").setup({})
	require("mason-lspconfig").setup({})
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},
	config = config_function,
	event = "VeryLazy",
}
