local function config_function()
	local cmp = require("cmp")
	cmp.setup({
		window = {
			completion = cmp.config.window.bordered({
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			}),
			documentation = cmp.config.window.bordered({
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			}),
		},
		mapping = cmp.mapping.preset.insert({
			-- Tab selects the first item
			["<Tab>"] = cmp.mapping.confirm({ select = true }),

			-- Ctrl + space triggers completion menu
			["<C-Space>"] = cmp.mapping.complete(),

			-- Ctrl +j/k navigates in completion menu
			["<C-j>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				end
			end, { "i", "s" }),
			["<C-k>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),
		sorting = {
			comparators = {
				require("cmp-under-comparator").under,
				cmp.config.compare.exact,
				cmp.config.compare.locality,
				cmp.config.compare.recently_used,
				cmp.config.compare.order,
				cmp.config.compare.offset,
				cmp.config.compare.score,
				cmp.config.compare.kind,
			},
		},
	})
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		-- sorting autocomplete list
		"lukas-reineke/cmp-under-comparator",
	},
	config = config_function,
	event = "LspAttach",
}
