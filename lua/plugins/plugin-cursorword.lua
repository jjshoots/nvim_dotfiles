local function config_function()
	vim.cmd([[
      hi CursorWord guibg=#313E42
    ]])
end

return {
	"xiyaowong/nvim-cursorword",
	event = "BufReadCmd",
	config = config_function,
}
