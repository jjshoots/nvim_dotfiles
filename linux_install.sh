# install nvim
sudo apt update
sudo apt install snapd -y
sudo apt purge neovim
sudo snap install nvim --classic

# Install dependencies
sudo apt update
sudo apt install git ripgrep fd-find npm curl --yes

# Install neovim
sudo snap install neovim --classic

# Clone the repo
git clone https://github.com/jjshoots/nvim_dotfiles.git ~/.config/nvim
