local dimHighlight = {
    "DimBlanklineHighlight1",
    "DimBlanklineHighlight2",
    "DimBlanklineHighlight3",
    "DimBlanklineHighlight4",
    "DimBlanklineHighlight5",
    "DimBlanklineHighlight6",
}
local brightHighlight = {
    "BrightBlanklineHighlight1",
    "BrightBlanklineHighlight2",
    "BrightBlanklineHighlight3",
    "BrightBlanklineHighlight4",
    "BrightBlanklineHighlight5",
    "BrightBlanklineHighlight6",
}

local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "DimBlanklineHighlight1", { fg = "#6C3539" })
    vim.api.nvim_set_hl(0, "DimBlanklineHighlight2", { fg = "#5F4F32" })
    vim.api.nvim_set_hl(0, "DimBlanklineHighlight3", { fg = "#445835" })
    vim.api.nvim_set_hl(0, "DimBlanklineHighlight4", { fg = "#29575D" })
    vim.api.nvim_set_hl(0, "DimBlanklineHighlight5", { fg = "#284761" })
    vim.api.nvim_set_hl(0, "DimBlanklineHighlight6", { fg = "#4D2F57" })
    vim.api.nvim_set_hl(0, "BrightBlanklineHighlight1", { fg = "#8A5357" })
    vim.api.nvim_set_hl(0, "BrightBlanklineHighlight2", { fg = "#7D6D50" })
    vim.api.nvim_set_hl(0, "BrightBlanklineHighlight3", { fg = "#627653" })
    vim.api.nvim_set_hl(0, "BrightBlanklineHighlight4", { fg = "#47757B" })
    vim.api.nvim_set_hl(0, "BrightBlanklineHighlight5", { fg = "#46657F" })
    vim.api.nvim_set_hl(0, "BrightBlanklineHighlight6", { fg = "#6B4D75" })
end)

require("ibl").setup(
    {
        indent = { highlight = dimHighlight },
        scope = {
            highlight = brightHighlight,
            show_start = false,
            show_end = false,
        },
    }
)
