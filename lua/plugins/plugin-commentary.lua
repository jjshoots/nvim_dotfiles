local function config_function()
	vim.cmd([[
    vmap <C-/> gcgv
    nmap <C-/> gcc
  ]])
end

return {
	"tpope/vim-commentary",
	config = config_function,
	event = "VeryLazy",
}
