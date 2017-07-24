#!/bin/bash

# Install and remove packages on a 17.04 Ubuntu system.
# This script was updated on 07/24/2017.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
ack-grep \
arj \
byobu \
bzr \
cabextract \
chromium-browser \
curl \
enigmail \
espeak \
flashplugin-installer \
git \
golang-go \
# google-talkplugin \
gufw \
indicator-multiload \
inkscape \
ipython \
ipython3 \
keepassx \
leafpad \
lm-sensors \
lxd \
# macchanger \
markdown \
meld \
mercurial \
mpack \
network-manager-openvpn-gnome \
p7zip-full \
p7zip-rar \
pastebinit \
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

# Create an alphabetical list of python packages to install.
pip_install=(path.py requests)

# Create an alphabetical list of packages to remove.
remove_packages=( \
account-plugin-facebook \
account-plugin-flickr \
account-plugin-ubuntuone \
aisleriot \
gnome-mahjongg \
gnome-sudoku \
thunderbird \
unity-scope-colourlovers \
unity-scope-gdrive \
unity-scope-texdoc \
unity-scope-tomboy \
unity-scope-yelp \
unity-scope-zotero \
)

echo "Updating the apt package list with the repository changes."
sudo apt-get update -qq

echo "Installing extra packages."
sudo apt-get install -y --force-yes ${install_packages[@]}

echo "Installing python packages."
sudo pip install -U ${pip_install[@]}

echo "Removing the unwanted packages."
sudo apt-get purge -y --force-yes ${remove_packages[@]}
sudo apt-get autoremove
sudo apt-get autoclean

echo "${0} script complete."
