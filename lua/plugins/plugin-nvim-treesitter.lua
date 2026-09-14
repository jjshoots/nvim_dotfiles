local languages = { "python", "c", "lua", "yaml" }

local function config_function()
	-- let rainbow handle brackets
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })

	-- Install the base set of parsers (async, no-op if already installed).
	require("nvim-treesitter").install(languages)

	-- Enable highlighting and indentation per buffer, auto-installing missing
	-- parsers on the fly (main branch has no `configs` module or auto_install).
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(args.match)
			if not lang then
				return
			end

			local function enable()
				if not pcall(vim.treesitter.start, args.buf, lang) then
					return
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end

			if vim.treesitter.language.add(lang) then
				enable()
			elseif vim.list_contains(require("nvim-treesitter").get_available(), lang) then
				require("nvim-treesitter").install(lang):await(function()
					if vim.api.nvim_buf_is_valid(args.buf) then
						enable()
					end
				end)
			end
		end,
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = config_function,
}
