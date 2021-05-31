## Location
Place in ~/.config

## Plug Install
Install Plug
```
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## CoC Install
Install NPM
```
sudo apt update && sudo apt install nodejs npm
```

PlugInstall inside Nvim w/ `:PlugInstall`

Install languages (add more languages as necessary)
```
:CocInstall coc-python coc-clangd coc-html coc-json coc-cmake coc-smartf
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
