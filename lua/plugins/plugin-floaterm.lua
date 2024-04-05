-- floaterm function with insert mode
local function floatermInsertEnter()
	vim.g.floaterm_autoinsert = true
	vim.cmd("FloatermToggle")
	vim.g.floaterm_autoinsert = false
end

local function config_function()
	vim.g.floaterm_width = 0.6
	vim.g.floaterm_height = 0.9
	vim.g.floaterm_wintype = "float"
	vim.g.floaterm_position = "right"
	vim.g.floaterm_title = "Terminal $1|$2"
	vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
	vim.g.floaterm_autoinsert = false

	-- colours
	vim.api.nvim_set_hl(0, "Floaterm", {})
	vim.cmd("highlight link FloatermBorder FloatBorder")
end

return {
	"voldikss/vim-floaterm",
	config = config_function,
	keys = {
		{ "<A-j>", floatermInsertEnter, mode = "n", noremap = true, silent = true },
		{ "<A-j>", "<C-\\><C-n><cmd>FloatermToggle<cr>", mode = "t", noremap = true, silent = true },
		{ "<A-k>", "<cmd>FloatermToggle<cr>", mode = "n", noremap = true, silent = true },
		{ "<A-k>", "<C-\\><C-n><cmd>FloatermToggle<cr>", mode = "t", noremap = true, silent = true },
		{ "<Esc>", "<C-\\><C-n>", mode = "t", noremap = true, silent = true },
	},
}
