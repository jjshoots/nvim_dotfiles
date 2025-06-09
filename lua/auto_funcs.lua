-- function to clean no-name empty buffers
local function clean_empty_buffers()
	local buffers = {}
	for i = 1, vim.fn.bufnr("$") do
		if
			vim.fn.buflisted(i) == 1
			and vim.fn.bufname(i) == ""
			and vim.fn.bufwinnr(i) < 0
			and vim.fn.getbufline(i, 1, "$")[1] == ""
		then
			table.insert(buffers, i)
		end
	end
	if #buffers > 0 then
		vim.cmd("bd! " .. table.concat(buffers, " "))
	end
end

-- function to handle entering a window
local function on_enter()
	if
		vim.bo.buftype ~= "nowrite"
		and vim.bo.buftype ~= "nofile"
		and vim.bo.buftype ~= "terminal"
		and vim.bo.buftype ~= "prompt"
		and vim.bo.buftype ~= "quickfix"
		and vim.bo.modifiable
	then
		vim.wo.cursorline = true
		vim.wo.signcolumn = "auto"
		vim.wo.relativenumber = true
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
		and vim.bo.modifiable
	then
		vim.wo.cursorline = false
		vim.wo.signcolumn = "no"
		vim.wo.relativenumber = false
		vim.wo.wrap = false
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
		vim.schedule(function()
			require("telescope.builtin").find_files()
		end)
	end
end

-- setup autocommands
local group
local autocmd_create = vim.api.nvim_create_autocmd

group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true })
autocmd_create("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "HighlightOnYank",
		})
	end,
	group = group,
})

group = vim.api.nvim_create_augroup("FocusWindows", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "BufWinEnter", "WinEnter" }, { callback = on_enter, group = group })
vim.api.nvim_create_autocmd("WinLeave", { callback = on_leave, group = group })

group = vim.api.nvim_create_augroup("CursorIgnoreOnFocus", { clear = true })
autocmd_create("FocusLost", { command = "let g:oldmouse=&mouse | set mouse=", group = group })
autocmd_create(
	"FocusGained",
	{ command = 'if exists("g:oldmouse") | let &mouse=g:oldmouse | unlet g:oldmouse | endif', group = group }
)

group = vim.api.nvim_create_augroup("AutoTrimWhiteSpace", { clear = true })
autocmd_create("BufWritePre", { callback = trim_whitespace, group = group })
autocmd_create({ "BufNewFile", "BufRead" }, { pattern = "*.world", command = "set syntax=xml", group = group })

group = vim.api.nvim_create_augroup("AutoWrapAndConceal", { clear = true })
autocmd_create("FileType", { pattern = "tex", command = "setlocal wrap", group = group })
autocmd_create("FileType", { pattern = "markdown", command = "setlocal wrap", group = group })
autocmd_create("FileType", { pattern = "markdown", command = "set conceallevel=2", group = group })
autocmd_create("FileType", { pattern = "json", command = "setlocal wrap", group = group })
autocmd_create("FileType", { pattern = "json", command = "set conceallevel=0", group = group })

group = vim.api.nvim_create_augroup("AutoTelescope", { clear = true })
autocmd_create("VimEnter", { callback = telescope_find_files, group = group })

group = vim.api.nvim_create_augroup("CleanBuffers", { clear = true })
autocmd_create("BufLeave", { callback = clean_empty_buffers, group = group })
