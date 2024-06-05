local function config_function()
	-- horizon colours from
	-- https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/ayu_mirage.lua
	local colors = {
		black = "#242b38",
		purple = "#d4bfff",
		white = "#d9d7ce",
		green = "#bbe67e",
		blue = "#59c2ff",
		darkblue = "#0071b3",
		orange = "#f07178",
		lightgray = "#607080",
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "horizon",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = {
				{
					"tabs",
					show_modified_status = true,
					mode = 0,
					max_length = vim.o.columns * 0.8,
					tabs_color = {
						inactive = { bg = colors.black, fg = colors.lightgray },
						active = { bg = colors.darkblue, fg = colors.white },
					},
					symbols = {
						modified = " ●", -- Text to show when the buffer is modified
						alternate_file = "", -- Text to show to identify the alternate file
						directory = "", -- Text to show when the buffer is a directory
					},
				},
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "hostname" },
		},
		winbar = {
			lualine_a = {
				{
					"buffers",
					show_modified_status = true,
					mode = 2,
					max_length = vim.o.columns * 0.8,
					buffers_color = {
						inactive = { bg = colors.black, fg = colors.lightgray },
						active = { bg = colors.blue, fg = colors.black },
					},
					symbols = {
						modified = " ●", -- Text to show when the buffer is modified
						alternate_file = "", -- Text to show to identify the alternate file
						directory = "", -- Text to show when the buffer is a directory
					},
				},
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = config_function,
	event = "VeryLazy",
}
