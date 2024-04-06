local function config_function()
	require("copilot").setup({
		panel = {
			enabled = false,
			auto_refresh = false,
			keymap = {
				jump_prev = "[[",
				jump_next = "]]",
				accept = "<CR>",
				refresh = "<nop>",
				open = "<M-CR>",
			},
			layout = {
				position = "bottom", -- | top | left | right
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = true,
			auto_trigger = false,
			debounce = 75,
			keymap = {
				accept = "<C-m>",
				accept_word = false,
				accept_line = false,
				next = "<C-l>",
				prev = "<C-h>",
				dismiss = "<Esc>",
			},
		},
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 18.x
		server_opts_overrides = {},
	})
end

return {
	"zbirenbaum/copilot.lua",
	config = config_function,
	keys = {
		{ "<C-l>", mode = "i" },
		{ "<C-h>", mode = "i" },
	},
}
