#!/bin/bash

# Install and remove packages on a 17.04 Ubuntu system.
# This script was updated on 07/24/2017.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
byobu \
cabextract \
chromium-browser \
curl \
docker.io \
enigmail \
espeak \
flashplugin-installer \
git \
golang-go \
gufw \
indicator-multiload \
inkscape \
ipython \
ipython3 \
keepassx \
leafpad \
lm-sensors \
lxd \
markdown \
meld \
mpack \
network-manager-openvpn-gnome \
p7zip-full \
p7zip-rar \
pastebinit \
pidgin \
python3-flake8 \
python3-pip \
python-dev \
python-flake8 \
python-pip \
python-virtualenv \
qemu-kvm \
qemu-system \
rar \
sharutils \
ssh \
synaptic \
tree \
unace \
unrar \
uudeview \
vim \
vim-gnome \
virt-manager \
yubikey-personalization \
)

# Create an alphabetical list of packages to remove.
remove_packages=( \
aisleriot \
gnome-mahjongg \
gnome-mines \
gnome-sudoku \
thunderbird \
)

echo "Updating the apt package list with the repository changes."
sudo apt-get update -qq

echo "Installing extra packages."
sudo apt-get install -y --force-yes ${install_packages[@]}

echo "Removing the unwanted packages."
sudo apt-get purge -y --allow-remove-essential ${remove_packages[@]}
sudo apt-get autoremove
sudo apt-get autoclean

echo "Installing Python packages found in ${HOME}/workspace/python/requirements.txt"
pip install --user -r ${HOME}/workspace/python/requirements.txt
pip3 install --user -r ${HOME}/workspace/python/requirements.txt

echo "${0} script complete."
