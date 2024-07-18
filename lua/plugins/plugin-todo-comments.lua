local function config_function()
end

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>d", ":TodoTelescope keywords=TODO,FIX,BUG,WARN,WARNING,PERF <CR>", mode = "n", noremap = true, silent = true },
  },
}
