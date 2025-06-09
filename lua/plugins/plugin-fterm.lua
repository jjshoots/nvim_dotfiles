local function config_function()
  require("FTerm").setup({
    border = "single",
    dimensions = {
      height = 0.9,
      width = 0.6,
      x = 1.0, -- aligns to the right
      y = 0.5,
    },
    hl = "Normal",
    blend = 0,
  })

  -- <A-j>: Toggle terminal and enter insert mode (like floaterm_autoinsert)
  vim.keymap.set("n", "<A-j>", function()
    require("FTerm").open()
    vim.cmd("startinsert")
  end, { noremap = true, silent = true })

  vim.keymap.set("t", "<A-j>", [[<C-\><C-n><CMD>lua require("FTerm").toggle()<CR>]],
    { noremap = true, silent = true })

  -- <A-k>: Toggle terminal and enter terminal-normal mode (without cursor movement)
  vim.keymap.set("n", "<A-k>", function()
    require("FTerm").toggle()
    vim.schedule(function()
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true),
        "n",
        false
      )
    end)
  end, { noremap = true, silent = true })

  vim.keymap.set("t", "<A-k>", [[<C-\><C-n><CMD>lua require("FTerm").toggle()<CR>]],
    { noremap = true, silent = true })

  -- Escape from terminal mode
  vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

  -- Optional: Apply terminal styling highlights
  vim.api.nvim_set_hl(0, "FTerm", {})
  vim.cmd("highlight link FTermBorder FloatBorder")
end

return {
  "numToStr/FTerm.nvim",
  config = config_function,
  keys = {
    { "<A-j>", desc = "FTerm open and insert", mode = { "n", "t" } },
    { "<A-k>", desc = "FTerm toggle (normal mode)", mode = { "n", "t" } },
    { "<Esc>", desc = "Exit terminal to normal", mode = "t" },
  },
}
