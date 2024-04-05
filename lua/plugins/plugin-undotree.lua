local function config_function() end

return {
	"mbbill/undotree",
	config = config_function,
	keys = {
		{ "<C-z>", "<cmd>UndotreeToggle<cr>", mode = "n", noremap = true, silent = true },
	},
}
