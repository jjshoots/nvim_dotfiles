call plug#begin('~/.nvim/plugged')

" Edge colorscheme
Plug 'sainnhe/sonokai'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}

" brackets
Plug 'kylechui/nvim-surround'

" repeat commonly used plugins
Plug 'tpope/vim-repeat'

" highlight matching word under cursor
Plug 'xiyaowong/nvim-cursorword'

" rainbow brackets
Plug 'luochen1990/rainbow'

" vim fugitive
Plug 'tpope/vim-fugitive'

" gitgutter integration
Plug 'airblade/vim-gitgutter'

" smart commenting
Plug 'tpope/vim-commentary'

" lualine and tree explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

" undotreevim terminal function not working with buffers
Plug 'mbbill/undotree'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" auto documentation
Plug 'heavenshell/vim-pydocstring', {'do': 'make install', 'for': 'python'}

" close brackets
Plug 'cohama/lexima.vim'

" for splitting and joining long arguments lists
Plug 'echasnovski/mini.splitjoin'

" floating terminal
Plug 'voldikss/vim-floaterm'

" telescope file finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.5'}

" the classic filetree
Plug 'nvim-tree/nvim-tree.lua'

" indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" tagbar
Plug 'preservim/tagbar'

" betterf
Plug 'jjshoots/betterf.nvim'

call plug#end()
