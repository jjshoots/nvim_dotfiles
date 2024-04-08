local function config_function()
  vim.g.pydocstring_enable_mapping = 0
end

return {
	"heavenshell/vim-pydocstring",
	config = config_function,
	ft = "python",
}
