local function config_function()
  require("mini.splitjoin").setup({
    mappings = {
      toggle = "<M-s>",
      split = "",
      join = "",
    },
  })
end

return {
	"echasnovski/mini.splitjoin",
	config = config_function,
  keys = {
    "<M-s>",
  }
}
