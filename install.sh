# Install dependencies
sudo apt update
sudo apt install git ripgrep fd-find --yes

# check if nvim exists
if ! command -v nvim &> /dev/null
then
    echo "nvim not found, installing from snap"
    sudo snap install nvim --classic
fi

# Install neovim
sudo snap install neovim --classic

# Clone the repo
git clone https://github.com/jjshoots/nvim_dotfiles.git ~/.config/nvim
