local highlight = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
}

local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#6C3539" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#5F4F32" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#445835" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#29575D" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#284761" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#4D2F57" })
end)

require("ibl").setup { indent = { highlight = highlight } }
