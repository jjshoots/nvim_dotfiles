local function config_function()
	-- keybindings
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			print("LSP Attached!")
			local opts = { buffer = event.buf }

			-- keybindings
			vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<M-[>", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "<M-]>", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>u", vim.diagnostic.open_float)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<M-u>", "<cmd>Telescope diagnostics<cr>", opts)
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
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

	-- enhance LSP capabilities with 'cmp_nvim_lsp' and enable dynamic file watching
	local lsp_capabilities = require("cmp_nvim_lsp")
	lsp_capabilities.default_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- lsp_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {},
		handlers = {
			function(server)
				require("lspconfig")[server].setup({
					capabilities = lsp_capabilities,
				})
			end,
		},
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