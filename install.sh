# Install dependencies
sudo apt update
sudo apt install git ripgrep fd-find --yes

# Install neovim
sudo snap install neovim --classic

# Clone the repo
git clone https://github.com/jjshoots/nvim_dotfiles.git ~/.config/nvim
