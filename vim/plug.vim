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

" vim airline
Plug 'vim-airline/vim-airline'

" vim fugitive
Plug 'tpope/vim-fugitive'

" smart commenting
Plug 'tpope/vim-commentary'

" devicons for file explorer
Plug 'ryanoasis/vim-devicons'

" undotreevim terminal function not working with buffers
Plug 'mbbill/undotree'

" rainbow brackets
Plug 'luochen1990/rainbow'

" gitgutter integration
Plug 'airblade/vim-gitgutter'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'numirias/semshi'

" polyglot for nicer syntax support
Plug 'sheerun/vim-polyglot'

" devicons
Plug 'ryanoasis/vim-devicons'

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
