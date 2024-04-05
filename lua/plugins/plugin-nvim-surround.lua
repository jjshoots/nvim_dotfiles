local function config_function()
	require("nvim-surround").setup({})
end

return {
	"kylechui/nvim-surround",
	version = "*",
	config = config_function,
	event = "VeryLazy",
}
