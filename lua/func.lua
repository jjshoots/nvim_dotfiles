-- function to handle entering a window
local function on_enter()
	if
		vim.bo.buftype ~= "nowrite"
		and vim.bo.buftype ~= "nofile"
		and vim.bo.buftype ~= "terminal"
		and vim.bo.buftype ~= "prompt"
		and vim.bo.buftype ~= "quickfix"
	then
		if vim.bo.modifiable then
			vim.wo.cursorline = true
			vim.wo.signcolumn = "auto"
			vim.wo.relativenumber = true
			vim.wo.foldcolumn = "1"
		end

		if vim.bo.filetype == "tex" or vim.bo.filetype == "md" or vim.bo.filetype == "json" then
			vim.wo.wrap = true
		end
	end
end

-- function to handle leaving a window
local function on_leave()
	if
		vim.bo.buftype ~= "nowrite"
		and vim.bo.buftype ~= "nofile"
		and vim.bo.buftype ~= "terminal"
		and vim.bo.buftype ~= "prompt"
		and vim.bo.buftype ~= "quickfix"
	then
		if vim.bo.modifiable then
			vim.wo.cursorline = false
			vim.wo.signcolumn = "no"
			vim.wo.relativenumber = false
			vim.wo.wrap = false
			vim.wo.foldcolumn = "0"
		end
	end
end

-- function to trim whitespace
local function trim_whitespace()
	local save = vim.fn.winsaveview()
	vim.cmd([[keeppatterns %s/\s\+$//e]])
	vim.fn.winrestview(save)
end

-- function to open telescope find_files if no files are opened via command line
local function telescope_find_files()
	if #vim.v.argv == 2 then
		vim.cmd("Telescope find_files")
	end
end

-- setup autocommands
local group

group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = group,
})

group = vim.api.nvim_create_augroup("FocusWindows", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "BufWinEnter", "WinEnter" }, { callback = on_enter, group = group })
vim.api.nvim_create_autocmd("WinLeave", { callback = on_leave, group = group })

group = vim.api.nvim_create_augroup("CursorIgnoreOnFocus", { clear = true })
vim.api.nvim_create_autocmd("FocusLost", { command = "let g:oldmouse=&mouse | set mouse=", group = group })
vim.api.nvim_create_autocmd(
	"FocusGained",
	{ command = 'if exists("g:oldmouse") | let &mouse=g:oldmouse | unlet g:oldmouse | endif', group = group }
)

group = vim.api.nvim_create_augroup("FileStuff", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { callback = trim_whitespace, group = group })
vim.api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = "*.world", command = "set syntax=xml", group = group }
)

group = vim.api.nvim_create_augroup("AutoWrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", { pattern = "tex", command = "setlocal wrap", group = group })
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "setlocal wrap", group = group })

group = vim.api.nvim_create_augroup("AutoTelescope", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", { callback = telescope_find_files, group = group })

group = vim.api.nvim_create_augroup("AutoConceal", { clear = true })
vim.api.nvim_create_autocmd("FileType", { pattern = "json", command = "set conceallevel=0", group = group })
vim.api.nvim_create_autocmd("FileType", { pattern = "md", command = "set conceallevel=2", group = group })
