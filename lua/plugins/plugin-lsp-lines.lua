local function toggle_lsp_lines()
  -- alias otherwise we cannot use very lazy
  require("lsp_lines").toggle()
end

local function config_function()
  require("lsp_lines").setup()
  vim.diagnostic.config {
    virtual_lines = true,
  }
  require("lsp_lines").toggle()
end

return {
	"maan2003/lsp_lines.nvim",
	config = config_function,
  keys = {
		{ "<leader>u", toggle_lsp_lines, mode = "n", noremap = true, silent = true },
  },
}
