" numbering
set number
set relativenumber

" search settings
set nohlsearch
set incsearch
set cpoptions+=x
set ignorecase
set smartcase

" no sounds please
set noerrorbells

" split properly
set splitright splitbelow

" wrapping, tabs, indentation
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set linebreak
set breakindent
set breakindent
set breakindentopt=shift:4,min:80,sbr
set showbreak=>-

" fold settings
set foldmethod=indent
set nofoldenable

" no need backup cause we use undodir
set nobackup
set noswapfile
set undodir=~/.nvim/undodir
set undofile

" looks
set termguicolors
set scrolloff=8
set conceallevel=2

" hide status cause we using powerline
set noshowmode

" allow mouse
set mouse=a

" fugitive stuff
set diffopt+=vertical
set signcolumn
