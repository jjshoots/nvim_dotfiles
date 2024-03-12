-- NATIVE MAPPINGS
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		print("LSP Attached!")
		local opts = { buffer = event.buf }

		-- buffer-local keybindings
		vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<M-[>", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "<M-]>", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<space>l", vim.diagnostic.open_float)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "x" }, "<F3>", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		vim.keymap.set("n", "<M-l>", "<cmd>Telescope diagnostics<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

		-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		-- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		-- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
	require("lspconfig")[server].setup({
		capabilities = lsp_capabilities,
	})
end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		default_setup,
	},
})

-- disable inlay hints
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

-- AUTOCOMPLETION
local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
	},
	sorting = {
		comparators = {
			require("cmp-under-comparator").under,
			cmp.config.compare.exact,
			cmp.config.compare.locality,
			cmp.config.compare.recently_used,
			cmp.config.compare.order,
			cmp.config.compare.offset,
			cmp.config.compare.score,
			cmp.config.compare.kind,
		},
	},
	mapping = cmp.mapping.preset.insert({
		-- Tab selects the first item
		["<Tab>"] = cmp.mapping.confirm({ select = true }),

		-- Ctrl + space triggers completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Ctrl +j/k navigates in completion menu
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			end
		end, { "i", "s" }),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

-- CUSTOM CALLBACK FOR AUTO BRACKETS FOR FUNCTIONS AND CLASS
local function on_confirm_done(evt)
	local entry = evt.entry
	local item = entry:get_completion_item()
	local types = require("cmp.types")

	if evt.commit_character then
		return
	end

	if
		entry:get_kind() == types.lsp.CompletionItemKind.Function
		or entry:get_kind() == types.lsp.CompletionItemKind.Method
		or entry:get_kind() == types.lsp.CompletionItemKind.Class
	then
		local keys = vim.api.nvim_replace_termcodes("(", false, false, true)
		vim.api.nvim_feedkeys(keys, "i", true)
		return
	end
end
cmp.event:on("confirm_done", on_confirm_done)
