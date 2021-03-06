#!/bin/bash

# Install and remove packages on a 16.10 Ubuntu system.
# This script was updated on 01/04/2017.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
ack-grep \
arj \
build-essential \
byobu \
bzr \
cabextract \
chromium-browser \
curl \
enigmail \
espeak \
file-roller \
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
python3 \
python3-flake8 \
python3-pip \
python3-requests \
python3-setuptools \
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
ufw \
unace \
unrar \
unzip \
uudeview \
vim \
vim-gnome \
virt-manager \
yubikey-personalization \
zip \
)

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

echo "Removing the unwanted packages."
sudo apt-get purge -y --force-yes ${remove_packages[@]}
sudo apt-get autoremove
sudo apt-get autoclean

echo "Installing Python packages found in ${HOME}/workspace/python/requirements.txt"
pip install --user -r ${HOME}/workspace/python/requirements.txt
pip3 install --user -r ${HOME}/workspace/python/requirements.txt

echo "${0} script complete."
