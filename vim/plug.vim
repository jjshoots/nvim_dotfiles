call plug#begin('~/.nvim/plugged')

" Edge colorscheme
Plug 'jjshoots/edge-jet'
Plug 'sainnhe/sonokai'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-github-dashboard'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" brackets
Plug 'tpope/vim-surround'

" repeat commonly used plugins
Plug 'tpope/vim-repeat'

" highlight matching word under cursor
Plug 'dominikduda/vim_current_word'

" rainbow brackets
Plug 'luochen1990/rainbow'

" vim fugitive
Plug 'tpope/vim-fugitive'

" gitgutter integration
Plug 'airblade/vim-gitgutter'

" smart commenting
Plug 'tpope/vim-commentary'

" lualine and tree explorer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

" undotreevim terminal function not working with buffers
Plug 'mbbill/undotree'

" syntax highlighting for python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for':['python', 'vim-plug']}
Plug 'sheerun/vim-polyglot'

" auto documentation
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" close brackets
Plug 'cohama/lexima.vim'

" floating terminal
Plug 'voldikss/vim-floaterm'

" telescope file finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'nvim-0.6' }

" indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" for latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'

" automatic resizing
Plug 'beauwilliams/focus.nvim'

call plug#end()
