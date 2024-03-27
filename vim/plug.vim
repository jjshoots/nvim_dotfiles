call plug#begin('~/.nvim/plugged')

" Edge colorscheme
Plug 'sainnhe/sonokai'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" For LSP
" the basic stuff
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
" sorting autocomplete list
Plug 'lukas-reineke/cmp-under-comparator'
" better lsp displays
Plug 'folke/noice.nvim'
" Copilot
Plug 'zbirenbaum/copilot.lua'

" vim fugitive and gitgutter
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" lualine
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.5'}
Plug 'stevearc/aerial.nvim'

" file tree
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v3.x'}

" indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" highlight matching word under cursor
Plug 'xiyaowong/nvim-cursorword'

" floating terminal
Plug 'voldikss/vim-floaterm'

" undotree
Plug 'mbbill/undotree'

" easy surround, rainbow brackets, and autoclose brackets
Plug 'kylechui/nvim-surround'
Plug 'luochen1990/rainbow'
Plug 'm4xshen/autoclose.nvim'

" smart commenting
Plug 'tpope/vim-commentary'

" for splitting and joining long arguments lists
Plug 'echasnovski/mini.splitjoin'

" repeat commonly used plugins
Plug 'tpope/vim-repeat'

" auto documentation
Plug 'heavenshell/vim-pydocstring', {'do': 'make install', 'for': 'python'}

" betterf
Plug 'jjshoots/betterf.nvim'

call plug#end()
