# Description

I keep in this file solutions to various installations steps or problems I had to get my environment running smoothly. All of the following is done in the context of a fresh Ubuntu LTS (16.01) installation on WSL2.

## Main tools installation
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt install neovim stow net-tools lua5.3 gcc g++

wget -c http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
sudo apt-get install ./exa_0.9.0-4_amd64.deb

## dotfiles download and setup (with stow)

git clone https://github.com/fbellin/.dotfiles.git

cd
mv .bashrc .bashrc.old
cd .dotfiles
stow bash
stow bin
stow nvim
stow tmux
stow exa
stow git

## Neovim configuration

vi
:PackerUpdate
:LspInstallInfo
:LspInstall

Installer les serveurs suivants :
- sumneko_lua
- pyright
- rust_analyzer
- eslint
- svelte

## Node installation

Beware of the release you install with this command. You should check [installation instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

## Rust install

sudo apt install build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Pugin manager for neovim 

TODO : check if there is an error : I thought I was using Packer and not vim-plug

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Docker configuration after Docker for Windows installation

Without the following, docker must be run with sudo in WSL2.

```bash
sudo usermod -aG docker $USER
```

## Miscellaneous topics which may not be considered

git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"

sudo apt install libnss3-tools

