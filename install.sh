#!/bin/bash

# Define something
username=$(id -u -n 1000)
builddir=$(pwd)

# Check if Script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "You are not a root, run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
apt update && apt upgrade -y

# Making folders
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/.icons
mkdir -p /home/$username/.themes
mkdir -p /home/$username/Pictures
mkdir -p /home/$username/Music
mkdir -p /home/$username/Documents
mkdir -p /home/$username/Programs
mkdir -p /home/$username/github

# Installing Essential Programs
apt install git curl gettext fd-find ripgrep cmake make gcc rofi kitty thunar feh lxpolkit x11-xserver-utils unzip wget pulseaudio alsa-utils build-essential libx11-dev libxft-dev libxinerama-dev -y

# Installing less important Programs
apt install lxappearance scrot ninja-build -y

### Installing Programming Language

# Install nvm(node version manager) for installing nodejs & npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install node
npm install -g npm@9.8.0

# Installing Python dependencies
apt install pipx

### Installing Theme & cursor & icons & Fonts

# Theme
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-darker.tar.xz
tar -zxvf Nordic-darker.tar.xz -c $HOME/.themes/
rm -rf Nordic-darker.tar.xz

# Cursor
wget https://github.com/alvatip/Nordzy-cursors/releases/download/v0.6.0/Nordzy-cursors-white.tar.gz
tar -zxvf Nordzy-cursors-white.tar.gz -C $HOME/.icons/
rm -rf Nordzy-cursors-white.tar.gz

# icons
sudo apt install papirus-icon-theme

# Fonts


### Installing Firefox
cd /home/$username/Programs/
wget https://ftp.mozilla.org/pub/firefox/releases/118.0.1/linux-x86_64/en-GB/firefox-118.0.1.tar.bz2
tar -xjf firefox-118.0.1.tar.bz2
rm -rf firefox-118.0.1.tar.bz2

## Installing Bashtop
git clone https://github.com/aristocratos/bashtop.git
cd bashtop
sudo make install

### Installing neovim
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# Installing Essential Programs for qtile tiling window manager
apt install xserver-xorg-dev libpangocairo python3-xcffib

# Instsalling qtile tiling window manager
# pipx install --no-cache-dir cairocffi
# pipx install cffi xcffib dbus-next
