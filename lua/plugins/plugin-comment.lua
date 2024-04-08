local function reselect_last_visual_selection()
	vim.cmd("normal! gv")
end

local function config_function()
	require("Comment").setup({
		padding = true,
		sticky = true,
		ignore = "^$",
		toggler = {
			-- Line-comment toggle keymap
			line = "<C-/>",
			-- Block-comment toggle keymap
			block = "<nop>",
		},
		-- LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			-- Line-comment keymap
			line = "<C-/>",
			-- Block-comment keymap
			block = "<nop>",
		},
		-- LHS of extra mappings
		extra = {
			-- Add comment on the line above
			above = "<nop>",
			-- Add comment on the line below
			below = "<nop>",
			-- Add comment at the end of line
			eol = "<nop>",
		},
		-- Enable keybindings
		mappings = {
			-- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			-- Extra mapping; `gco`, `gcO`, `gcA`
			extra = false,
		},
		-- Function to call before (un)comment
		pre_hook = nil,
		-- Function to call after (un)comment
		post_hook = reselect_last_visual_selection,
	})
end

return {
	"numToStr/Comment.nvim",
	config = config_function,
	keys = {
    "<C-/>"
  },
}
