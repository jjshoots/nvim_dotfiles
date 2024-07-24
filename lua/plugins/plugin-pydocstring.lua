local function config_function()
	vim.g.pydocstring_enable_mapping = 0
	vim.g.pydocstring_formatter = "google"
  vim.g:pydocstring_doq_path = "$(which doq)"
end

return {
	"heavenshell/vim-pydocstring",
	config = config_function,
	build = "make install",
	ft = "python",
}
