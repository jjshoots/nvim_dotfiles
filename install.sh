# Apt update
sudo apt update

# Clone the repo
sudo apt install git neovim ripgrep fd-find --yes
git clone https://github.com/jjshoots/nvim_dotfiles.git ~/.config/nvim

# Install Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# CTags for tagbar
sudo apt install exuberant-ctags --yes

# Nvim PlugInstall
nvim +PlugInstall +qall
