# To do everything at once
Note that this will do everything except install custom fonts
```
curl -s https://raw.githubusercontent.com/jjshoots/nvim_dotfiles/master/install.sh | bash -s
```

# Take me through the steps

## Install Dependencies
```
sudo apt update
sudo apt install git ripgrep fd-find --yes
```

## Install neovim
```
sudo snap install neovim --classic
```

## Clone the repo
Change directory and clone it
```
cd ~/.config
git clone https://github.com/jjshoots/nvim_dotfiles.git nvim
```

## Install ripgrep and fd
```
sudo apt install fd-find ripgrep

```

# Custom Fonts

## Default Mononoki

curl -s https://raw.githubusercontent.com/jjshoots/mononoki-monospace-patched/master/install.sh | bash -s

## Other fonts

Download the font repo first:
```
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
```

Install Mononoki
```
cd nerd-fonts
./install.sh Mononoki
```

Change font to `Mononoki` in whatever terminal emulator you're using.
