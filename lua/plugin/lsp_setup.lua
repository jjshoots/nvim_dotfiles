-- NATIVE MAPPINGS
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		-- buffer-local keybindings
    vim.keymap.set("n", "<M-[>", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<M-]>", vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)

    vim.keymap.set("n", "<M-l>", "<cmd>Telescope diagnostics<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

		-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		-- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		-- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
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
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	virtual_text = false,
-- })

-- AUTOCOMPLETION
local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = cmp.mapping.preset.insert({
		-- Enter selects the item under cursor
		-- Tab selects the first item
		["<CR>"] = cmp.mapping.confirm({ select = false }),
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

-- THIS IS FOR SHOWING WHAT ARGUMENTS A FUNCTION ACCEPTS
local cfg = {
	debug = false, -- set to true to enable debug logging
	log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
	-- default is  ~/.cache/nvim/lsp_signature.log
	verbose = false, -- show debug line number

	bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- If you want to hook lspsaga or other signature handler, pls set to false
	doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
	-- set to 0 if you DO NOT want any API comments be shown
	-- This setting only take effect in insert mode, it does not affect signature help in normal
	-- mode, 10 by default

	max_height = 12, -- max height of signature floating_window
	max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	-- the value need >= 40
	wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

	floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
	-- will set to true when fully tested, set to false will use whichever side has more space
	-- this setting will be helpful if you do not want the PUM and floating win overlap

	floating_window_off_x = 1, -- adjust float windows x position.
	-- can be either a number or function
	floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
	-- can be either number or function, see examples

	close_timeout = 4000, -- close floating window after ms when laster parameter is entered
	fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = true, -- virtual hint enable
	hint_prefix = "★ ", -- the symbol to indicate possible hint
	hint_scheme = "String",
	hint_inline = function()
		return false
	end, -- should the hint be inline(nvim 0.10 only)?  default false
	-- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
	-- return 'right_align' to display hint right aligned in the current line
	hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
	handler_opts = {
		border = "rounded", -- double, rounded, single, shadow, none, or a table of borders
	},

	always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

	auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
	extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

	padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc

	transparency = nil, -- disabled by default, allow floating win transparent value 1~100
	shadow_blend = 36, -- if you using shadow as border use this set the opacity
	shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
	timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
	toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
	-- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
	-- may not popup when typing depends on floating_window setting

	select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
	move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

require("lsp_signature").setup(cfg) -- no need to specify bufnr if you don't use toggle_key
