require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	cmdline = {
		enabled = false,
	},
	messages = {
		enabled = false,
	},
	presets = {
		lsp_doc_border = true,
	},
	views = {
		mini = {
			win_options = {
				winblend = 0,
			},
		},
		hover = {
			win_options = {
				winhighlight = {
					Normal = "Normal",
					FloatBorder = "BorderBG",
					CursorLine = "PmenuSel",
					Search = "None",
				},
			},
		},
		popupmenu = {
			win_options = {
				winhighlight = {
					Normal = "Normal",
					FloatBorder = "BorderBG",
					CursorLine = "PmenuSel",
					Search = "None",
				},
			},
		},
		popup = {
			win_options = {
				winhighlight = {
					Normal = "Normal",
					FloatBorder = "BorderBG",
					CursorLine = "PmenuSel",
					Search = "None",
				},
			},
		},
		confirm = {
			win_options = {
				winhighlight = {
					Normal = "Normal",
					FloatBorder = "BorderBG",
					CursorLine = "PmenuSel",
					Search = "None",
				},
			},
		},
	},
})
