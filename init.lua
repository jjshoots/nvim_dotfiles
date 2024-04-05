-- bootstrap lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- function to call files
local function call(file)
	vim.cmd("source " .. file)
end

-- function to iterate through all paths in table
local function call_all(list)
	for _, file in pairs(list) do
		local ok, err = pcall(call, file)
		if not ok then
			print("Error calling " .. file)
			print(err)
		end
	end
end

-- source vim stuff
local vim_paths = vim.split(vim.fn.glob("$HOME/.config/nvim/vim/*.vim"), "\n")
call_all(vim_paths)

-- source lua stuff
local lua_paths = vim.split(vim.fn.glob("$HOME/.config/nvim/lua/*.lua"), "\n")
call_all(lua_paths)

-- lazy load plugins
require("lazy").setup("plugins")
