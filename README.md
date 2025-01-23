# To do everything at once
Note that this will do everything except install custom fonts

Linux:
```sh
curl -fsSL https://raw.githubusercontent.com/jjshoots/nvim_dotfiles/master/install_linux.sh | bash -s
```

MacOS:
```
curl -fsSL https://raw.githubusercontent.com/jjshoots/nvim_dotfiles/master/install_macos.sh | bash
```

# Take me through the steps

## Install Dependencies

```sh
sudo apt update
sudo apt install git ripgrep fd-find --yes
```

## Install neovim

```sh
sudo snap install neovim --classic
```

## Clone the repo
Change directory and clone it

```sh
cd ~/.config
git clone https://github.com/jjshoots/nvim_dotfiles.git nvim
```

## Install ripgrep and fd

```sh
sudo apt install fd-find ripgrep
```

# Custom Fonts

I use a custom patched monospaced font:

```sh
git@github.com:jjshoots/mononoki-monospaced.git
```

## To use any other font:

Download the font repo first:

```sh
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
```

Install Mononoki
```
cd nerd-fonts
./install.sh Mononoki
```

Change font to `mononoki Nerd Font Mono` in whatever terminal emulator you're using.
