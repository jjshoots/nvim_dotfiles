-- looks
vim.o.termguicolors = true
vim.o.scrolloff = 8

-- no sounds please
vim.o.errorbells = false

-- infinite timeout
vim.o.timeoutlen = 5000

-- numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- search settings
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.cpoptions = vim.o.cpoptions .. "x"
vim.o.ignorecase = true
vim.o.smartcase = true

-- pop up menu height
vim.o.pumheight = 10

-- split properly
vim.o.splitright = true
vim.o.splitbelow = true

-- wrapping, tabs, indentation
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.breakindentopt = "shift:4,min:80,sbr"
vim.o.showbreak = ">-"

-- fold settings
vim.o.foldmethod = "indent"
vim.o.foldenable = false

-- no need backup cause we use undodir
vim.o.backup = false
vim.o.swapfile = false
vim.o.undodir = vim.fn.expand("~/.nvim/undodir")
vim.o.undofile = true

-- hide status cause we using powerline
vim.o.showmode = false

-- allow mouse
vim.o.mouse = "a"

-- fugitive stuff and sign column
vim.o.diffopt = vim.o.diffopt .. ",vertical"
vim.wo.signcolumn = "yes"

-- set up clipboard integration
vim.api.nvim_set_var("clipboard", {
	copy = {
		["+"] = "xsel --clipboard --input",
		["*"] = "xsel --clipboard --input",
	},
	paste = {
		["+"] = "xsel --clipboard --output",
		["*"] = "xsel --clipboard --output",
	},
	cache_enabled = 1,
})

-- use the system clipboard by default
vim.o.clipboard = "unnamedplus"
