-- for indent blankline
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#6C3539 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#5F4F32 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#445835 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#29575D gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#284761 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#4D2F57 gui=nocombine]]

require("indent_blankline").setup {
  buftype_exclude = {"terminal"},
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}

require("focus").setup()
