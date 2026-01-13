local function toggle_gstatus()
	local found = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local name = vim.api.nvim_buf_get_name(buf)
		if string.find(name, "fugitive://") then
			vim.api.nvim_win_close(win, false)
			found = true
			break
		end
	end
	if not found then
		vim.cmd("vertical Git")
		vim.cmd("vertical resize 120")
		vim.cmd("normal! 4j")
	end
end

local function config_function()
	-- command for closing diff view
	vim.cmd("command! Diffquit normal! ZZ:Gedit<CR>")
end

return {
	"tpope/vim-fugitive",
	config = config_function,
	keys = {
		{ "<M-f>", toggle_gstatus, mode = "n", noremap = true, silent = true },
	},
}
