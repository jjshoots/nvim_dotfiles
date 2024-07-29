local function config_function()
	vim.g.pydocstring_enable_mapping = 0
	vim.g.pydocstring_formatter = "google"

	local handle = io.popen("which doq")
	local doq_path = handle:read("*a"):gsub("%s+", "") -- Remove any trailing whitespace
	handle:close()
	vim.g.pydocstring_doq_path = doq_path
end

return {
	"heavenshell/vim-pydocstring",
	config = config_function,
	build = "make install",
	ft = "python",
}
