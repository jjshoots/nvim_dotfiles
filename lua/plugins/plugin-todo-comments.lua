local function config_function()
	vim.keymap.set(
		"n",
		"<leader>st",
		":TodoTelescope keywords=TODO,FIX,BUG,WARN,WARNING,PERF <CR>",
		{ desc = "[S]earch [T]odo" }
	)
end

return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config_function,
}
