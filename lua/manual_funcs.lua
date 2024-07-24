-- copy filepath of current file to clipboard
local function copy_filepath_to_clipboard()
	local filepath = vim.api.nvim_buf_get_name(0)
	vim.fn.setreg("+", filepath)
	print("File path copied: " .. filepath)
end
vim.api.nvim_create_user_command("CopyFilePath", copy_filepath_to_clipboard, {})
vim.api.nvim_create_user_command("CFP", copy_filepath_to_clipboard, {})
