local function config_function()
	-- keybindings
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			-- function for easy map
			local function map(mode, keys, func, desc)
				vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			-- automappings for vsplit, hsplit, newtab
			local function split_tab_map(telescope_function, key, definition)
				local vsplit_keymap = string.format("g%s", string.upper(key))
				local hsplit_keymap = string.format("g<C-%s>", key)
				local newtab_keymap = string.format("g<M-%s>", key)

				map("n", vsplit_keymap, function()
					vim.cmd("vsplit")
					telescope_function()
				end, string.format("Go to %s in new vertical split.", definition))
				map("n", hsplit_keymap, function()
					vim.cmd("split")
					telescope_function()
				end, string.format("Go to %s in new horizontal split.", definition))
				map("n", newtab_keymap, function()
					vim.cmd("tab split")
					telescope_function()
				end, string.format("Go to %s in new tab.", definition))
			end

			-- keybindings
			map("i", "<C-s>", vim.lsp.buf.signature_help, "Signature help.")
			map("n", "<M-[>", vim.diagnostic.goto_prev, "Previous diagnostics.")
			map("n", "<M-]>", vim.diagnostic.goto_next, "Next diagnostics.")
			map("n", "<leader>u", vim.diagnostic.open_float, "Expand diagnostics.")
			map("n", "K", vim.lsp.buf.hover, "Hover Definition.")
			map("n", "<leader>r", vim.lsp.buf.rename, "Rename.")
			map("n", "<M-u>", require("telescope.builtin").diagnostics, "Show all diagnostics.")
			map("n", "gd", require("telescope.builtin").lsp_definitions, "Go to definition.")
			map("n", "gr", require("telescope.builtin").lsp_references, "Show all references.")
			map("n", "gt", require("telescope.builtin").lsp_type_definitions, "Go to typedef.")
			split_tab_map(require("telescope.builtin").lsp_definitions, "d", "definitions")
			split_tab_map(require("telescope.builtin").lsp_references, "r", "definitions")
			split_tab_map(require("telescope.builtin").lsp_type_definitions, "t", "definitions")

			-- Map the function to the key combinations
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

			-- border for diagnostics
			vim.diagnostic.config({
				float = { border = "rounded" },
			})
			vim.cmd([[
        hi DiagnosticError guibg=NONE
        hi DiagnosticWarn guibg=NONE
        hi DiagnosticInfo guibg=NONE
        hi DiagnosticHint guibg=NONE
        hi DiagnosticVirtualTextError guibg=NONE
        hi DiagnosticVirtualTextWarn guibg=NONE
        hi DiagnosticVirtualTextInfo guibg=NONE
        hi DiagnosticVirtualTextHint guibg=NONE
      ]])
		end,
	})

	-- I have no idea what these lines are doing
	-- update capabilities with nvim cmp
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- setup the servers
	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {
		  "lua_ls",
		  "pyright",
		  "typos_lsp",
		},
	})
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},
	config = config_function,
	event = "VeryLazy",
}
