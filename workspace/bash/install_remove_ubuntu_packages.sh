#!/bin/bash

# Install and remove packages on a 15.04 Ubuntu system.
# This script was written on 02/02/2015.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
#amulet \
arj \
build-essential \
byobu \
bzr \
cabextract \
charm-tools \
chromium-browser \
docker.io \
enigmail \
espeak \
file-roller \
flashplugin-installer \
git \
golang-go \
google-talkplugin \
gufw \
indicator-multiload \
inkscape \
ipython3 \
juju-core \
juju-local \
leafpad \
lm-sensors \
macchanger \
markdown \
meld \
mercurial \
mpack \
p7zip-full \
p7zip-rar \
python3 \
python3-flake8 \
python3-requests \
python3-setuptools \
python-dev \
python-pip \
python-virtualenv \
qemu-kvm \
qemu-system \
rar \
sharutils \
ssh \
synaptic \
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

# Create an alphabetical list of python packages to install.
pip_install=(bundletester juju-deployer)

# Create an alphabetical list of packages to remove.
remove_packages=(aisleriot gnome-mahjongg gnome-sudoku)

read -p "Add the stable or devel Juju repository? " JUJU_REPOSITORY
if [[ -z $JUJU_REPOSITORY ]]; then
  JUJU_REPOSITORY="stable"
# JUJU_REPOSITORY="devel"
fi

# Create a list of repositories to add.
repositories=(ppa:juju/${JUJU_REPOSITORY} 'deb http://dl.google.com/linux/talkplugin/deb/ stable main')

echo "Adding repositories to the system."
for repository in "${repositories[@]}"; do
  sudo add-apt-repository -y "${repository}"
done

echo "Updating the apt package list with the repository changes."
sudo apt-get update 

echo "Removing the unwanted packages."
sudo apt-get purge -y ${remove_packages[@]}

echo "Installing extra packages."
sudo apt-get install -y --force-yes ${install_packages[@]}

echo "Installing python packages."
sudo pip install -U ${pip_install[@]}
