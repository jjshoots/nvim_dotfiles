-- source vim stuff
local vim_paths = vim.split(vim.fn.glob('$HOME/.config/nvim/vim/*.vim'), '\n')

for i, file in pairs(vim_paths) do
  vim.cmd('source ' .. file)
end

-- source lua plugin stuff
local plugin_paths = vim.split(vim.fn.glob('$HOME/.config/nvim/lua/plugin/*.lua'), '\n')

for i, file in pairs(plugin_paths) do
  vim.cmd('source ' .. file)
end

-- source coc extension stuff
local coc_paths = vim.split(vim.fn.glob('$HOME/.config/nvim/lua/coc/*.lua'), '\n')

for i, file in pairs(coc_paths) do
  vim.cmd('source ' .. file)
end

vim.cmd('source $HOME/.config/nvim/coc/coc.vim')
