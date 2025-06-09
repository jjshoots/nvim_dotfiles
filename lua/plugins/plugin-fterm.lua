return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "single", -- or "double" for more flair
      dimensions = {
        height = 0.9,
        width = 0.6,
        x = 1.0, -- Position on the right
        y = 0.5,
      },
      hl = "Normal",
      blend = 0,
    })

    -- Terminal toggle in normal mode (insert-on-open style)
    vim.keymap.set("n", "<A-j>", function()
      require("FTerm").open()
      vim.cmd("startinsert")
    end, { noremap = true, silent = true })

    -- Terminal toggle in terminal mode
    vim.keymap.set("t", "<A-j>", [[<C-\><C-n><CMD>lua require("FTerm").toggle()<CR>]],
      { noremap = true, silent = true })

    -- Additional toggle binding for ease
    vim.keymap.set("n", "<A-k>", "<CMD>lua require('FTerm').toggle()<CR>",
      { noremap = true, silent = true })
    vim.keymap.set("t", "<A-k>", [[<C-\><C-n><CMD>lua require("FTerm").toggle()<CR>]],
      { noremap = true, silent = true })

    -- Escape to normal mode from terminal
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

    -- Optional highlight link (like in your Floaterm setup)
    vim.api.nvim_set_hl(0, "FTerm", {})
    vim.cmd("highlight link FTermBorder FloatBorder")
  end,
  keys = {
    { "<A-j>", desc = "FTerm toggle insert", mode = { "n", "t" } },
    { "<A-k>", desc = "FTerm toggle", mode = { "n", "t" } },
    { "<Esc>", desc = "Escape terminal mode", mode = "t" },
  },
}
