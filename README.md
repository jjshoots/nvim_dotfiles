## Location
Place in `~/.config/nvim`

## Install Plug, PlugInstall plugins, Setup CoC
```
# Install Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# CoC Dependencies
sudo apt update && sudo apt install nodejs npm --yes
sudo npm install -g n
sudo n stable

# Nvim PlugInstall
nvim +PlugInstall +qall

# Install languages (add more languages as necessary)
nvim +'CocInstall coc-pyright coc-clangd coc-html coc-json coc-cmake coc-smartf' +qall
```

## Custom Fonts
Download the font repo first:
```
git clone https://github.com/ryanoasis/nerd-fonts.git
```

Install Meslo
```
cd nerd-fonts
./install.sh Meslo
```

Change terminal font to `MesloLGMDZ Nerd Font Regular`
