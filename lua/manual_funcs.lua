-- copy filepath of current file to clipboard
local function copy_filepath_to_clipboard()
	local filepath = vim.api.nvim_buf_get_name(0)
	vim.fn.setreg("+", filepath)
	print("File path copied: " .. filepath)
end
vim.api.nvim_create_user_command("CopyFilePath", copy_filepath_to_clipboard, {})
vim.keymap.set("n", "<C-y>", copy_filepath_to_clipboard, { desc = "Copy file path to clipboard" })

-- copy relative filepath of current file to clipboard (relative to cwd)
local function copy_relative_filepath_to_clipboard()
	local filepath = vim.api.nvim_buf_get_name(0)
	local cwd = vim.fn.getcwd()
	local relative_path = vim.fn.fnamemodify(filepath, ":~:.")
	vim.fn.setreg("+", relative_path)
	print("Relative file path copied: " .. relative_path)
end
vim.api.nvim_create_user_command("CopyRelativeFilePath", copy_relative_filepath_to_clipboard, {})
vim.keymap.set("n", "<C-S-y>", copy_relative_filepath_to_clipboard, { desc = "Copy relative file path to clipboard" })
