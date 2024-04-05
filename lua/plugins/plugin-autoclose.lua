local function config_function()
	require("autoclose").setup()
end

return {
	"m4xshen/autoclose.nvim",
	config = config_function,
	event = "VeryLazy",
}
