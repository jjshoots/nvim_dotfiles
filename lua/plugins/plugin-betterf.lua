local function config_function()
	require("betterf").setup({
		labels = {
			"a",
			"b",
			"c",
			"d",
			"e",
			"f",
			"g",
			"h",
			"i",
			"j",
			"k",
			"l",
			"m",
			"n",
			"o",
			"p",
			"q",
			"r",
			"s",
			"t",
			"u",
			"v",
			"w",
			"x",
			"y",
			"z",
			";",
		},
		color = "#ff0000",
		mappings = {
			"<leader>f",
			"<leader>F",
		},
	})
end

return {
	"jjshoots/betterf.nvim",
	config = config_function,
	keys = {
		"<leader>f",
		"<leader>F",
	},
}
