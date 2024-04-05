-- Toggle Git status
local function toggle_gstatus()
	local windows = vim.api.nvim_list_wins()
	local found = false

	for _, win in ipairs(windows) do
		local buf = vim.api.nvim_win_get_buf(win)
		local fugitive_status = vim.api.nvim_buf_get_var(buf, "fugitive_status")
		if fugitive_status ~= nil and fugitive_status ~= "" then
			vim.api.nvim_win_close(win, false)
			found = true
		end
	end

	if not found then
		vim.cmd("vertical Git")
		vim.cmd("vertical resize 70")
	end
end

local function config_function()
	-- Command for closing diff view
	vim.cmd("command! Diffquit normal! ZZ:Gedit<CR>")
end

return {
	"tpope/vim-fugitive",
	config = config_function,
	keys = {
		{ "<M-f>", toggle_gstatus, mode = "n", noremap = true, silent = true },
	},
}
