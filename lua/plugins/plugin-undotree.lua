local function config_function()
end

return {
	"mbbill/undotree",
	config = config_function,
  key = {
		{ "<C-z>", "<cmd>UndotreeToggle<cr>", mode = "n", noremap = true, silent = true },
  }
}
