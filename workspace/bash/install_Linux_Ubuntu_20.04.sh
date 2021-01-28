#!/bin/bash

# Install and remove packages on a 20.04 Ubuntu system.
# This script was updated on 01/27/2021.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
byobu \
cabextract \
curl \
debootstrap \
docker.io \
espeak \
git \
gufw \
htop \
indicator-multiload \
inkscape \
ipython3 \
keepassx \
libguestfs-tools \
lm-sensors \
lxc-templates \
lxc-utils \
markdown \
meld \
mpack \
net-tools \
p7zip-full \
p7zip-rar \
pastebinit \
pidgin \
pigz \
python3-flake8 \
python3-pip \
python3-virtualenv \
qemu-kvm \
qemu-system \
rar \
sharutils \
ssh \
sshpass \
ssh-askpass \
strace \
systemd-container \
tree \
unace \
unrar \
uudeview \
vim \
virt-manager \
wget \
whois \
)

# Create an alphabetical list of packages to remove.
remove_packages=( \
snapd \
)

echo "Updating the apt package list with the repository changes."
sudo apt update -qq

echo "Installing extra packages."
sudo apt install -y ${install_packages[@]}

echo "Removing the unwanted packages."
sudo apt purge -y --allow-remove-essential ${remove_packages[@]}
sudo apt autoremove -y
sudo apt autoclean

echo "Installing Python packages found in ${HOME}/workspace/python/requirements.txt"
pip3 install --user -r ${HOME}/workspace/python/requirements.txt

echo "${0} script complete."
