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

-- source lua plugin stuff
local plugin_paths = vim.split(vim.fn.glob("$HOME/.config/nvim/pluagins/*.lua"), "\n")
call_all(plugin_paths)
