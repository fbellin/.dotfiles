sudo apt update
sudo apt install neovim stow net-tools

git clone https://github.com/fbellin/.dotfiles.git

cd
mv .bashrc .bashrc.old
stow bash
stow bin
stow nvim
stow tmux

sudo apt install build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"

Dans neovim :
:PackerUpdate
:LspInstallInfo
et installer les serveurs de langages (pyright sumneko_lua eslint rust_analyzer)

wget -c http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb
sudo apt-get install ./exa_0.9.0-4_amd64.deb

sudo apt install libnss3-tools
