local function config_function()
	require("gitsigns").setup()
end

return {
	"lewis6991/gitsigns.nvim",
	config = config_function,
	event = "VeryLazy",
}
