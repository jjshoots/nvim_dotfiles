call plug#begin('~/.nvim/plugged')

" Edge colorscheme
Plug 'sainnhe/sonokai'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}

" vim fugitive
Plug 'tpope/vim-fugitive'

" gitgutter integration
Plug 'airblade/vim-gitgutter'

" smart commenting
Plug 'tpope/vim-commentary'

" lualine and tree explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

" telescope file finder and filetree
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.5'}
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v3.x'}

" floating terminal
Plug 'voldikss/vim-floaterm'

" undotreevim terminal function not working with buffers
Plug 'mbbill/undotree'

" indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" highlight matching word under cursor
Plug 'xiyaowong/nvim-cursorword'

" brackets
Plug 'kylechui/nvim-surround'

" rainbow brackets
Plug 'luochen1990/rainbow'

" close brackets
Plug 'cohama/lexima.vim'
"
" repeat commonly used plugins
Plug 'tpope/vim-repeat'

" for splitting and joining long arguments lists
Plug 'echasnovski/mini.splitjoin'

" auto documentation
Plug 'heavenshell/vim-pydocstring', {'do': 'make install', 'for': 'python'}

" tagbar
Plug 'preservim/tagbar'

" betterf
Plug 'jjshoots/betterf.nvim'

call plug#end()
