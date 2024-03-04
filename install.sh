# Install dependencies
sudo apt update
sudo apt install git ripgrep fd-find --yes

# Install neovim
sudo snap install neovim --classic

# Clone the repo
git clone https://github.com/jjshoots/nvim_dotfiles.git ~/.config/nvim

# Install Plug and plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qall

# Install ripgrep the fd
sudo apt install fd-find ripgrep

# Nvim PlugInstall
nvim +PlugInstall +qall
