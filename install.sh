#!/bin/sh

echo "Setting up dev environment..."

if ! [ $(command -v apt) ] || ! [ $(command -v curl) ]; then
  exit 1
fi

# install dependencies
dependencies="unzip automake autoconf pkg-config fontconfig zsh tmux vim"
echo "[-] Installing dependencies... [-]"
sudo apt-get update
echo -n $dependencies | xargs -d' ' -I % sh -c "echo installing %; sudo apt-get install -y % && echo % install successful || echo % install failed"
echo "done!"
echo

# install MesloLG Nerd Font
if [ $(ls ~/.fonts/Meslo* | wc -l) -eq 0 ]; then
  echo "[-] Downloading MesloLG Nerd Font... [-]"
  curl -o MesloLG.zip -fsSL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip 
  unzip MesloLG.zip -d ~/.fonts
  rm -f MesloLG.zip
  fc-cache -fv
  echo "done!"
  echo
fi

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "[-] Installing oh-my-zsh... [-]"
  sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "done!"
  echo
fi

# default to zsh
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
echo "zsh set as default shell"

# install Neovim
if ! [ -x $(command -v nvim) ]; then
  echo "[-] Installing Neovim... [-]"
  mkdir -p ~/bin
  curl -o ~/bin/nvim.appimage -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  ~/bin/nvim.appimage --appimage-extract
  rm ~/bin/nvim.appimage
  mv ~/bin/squashfs-root ~/bin/nvim.appimage
  ln -s ~/bin/nvim.appimage/AppRun ~/bin/nvim
  chmod u+x ~/bin/nvim
  echo "done!"
  echo
fi

# install universal-ctags
if ! [ $(command -v ctags) ]; then
  echo "[-] Installing universal-ctags... [-]"
  git clone https://github.com/universal-ctags/ctags.git
  cd ctags
  ./autogen.sh
  ./configure --prefix=$HOME
  make
  make install
  cd ..
  rm -rf ctags
  echo "done!"
fi

# install NvChad
if ! [ -h ~/.config/nvim ]; then
  ln -s $PWD/nvim ~/.config
  echo "NvChad configuration set for Neovim"
fi
