call plug#begin('~/.nvim/plugged')

" Edge colorscheme
Plug 'jjshoots/edge-jet'
Plug 'sainnhe/sonokai'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-github-dashboard'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" brackets
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" vim fugitive
Plug 'tpope/vim-fugitive'

" gitgutter integration
Plug 'airblade/vim-gitgutter'

" smart commenting
Plug 'tpope/vim-commentary'

" vim airline
Plug 'vim-airline/vim-airline'

" devicons for file explorer
Plug 'ryanoasis/vim-devicons'

" undotreevim terminal function not working with buffers
Plug 'mbbill/undotree'

" rainbow brackets
Plug 'luochen1990/rainbow'

" syntax highlighting for python
Plug 'numirias/semshi'
Plug 'sheerun/vim-polyglot'

" LSP
" Plug 'nvim-treesitter/nvim-treesitter'

" close brackets
Plug 'cohama/lexima.vim'

" highlight matching word under cursor
Plug 'dominikduda/vim_current_word'

" for nice scrolling
Plug 'psliwka/vim-smoothie'

" floating terminal
Plug 'voldikss/vim-floaterm'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'coreyja/fzf.devicon.vim'

" nerdtree
Plug 'preservim/nerdtree'

" indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
