local function config_function() end

return {
	"tpope/vim-repeat",
	config = config_function,
	event = "BufReadPost",
}
