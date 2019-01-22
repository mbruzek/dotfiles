#!/bin/bash

# Install software for a new Debian Linux system.
# This script was updated on 10/23/2018.

set -x

echo "Upgrading the packages on this system."
sudo apt update -qq

install_packages=(\
ack \
apt-transport-https \
byobu \
chromium \
curl \
espeak \
gdb \
golang-go \
imvirt \
iptables-persistent \
keepassx \
leafpad \
libguestfs \
macchanger \
meld \
pastebinit \
pidgin \
pidgin-sipe \
pigz \
python-pip \
python3-pip \
qemu-kvm \
qemu-system \
ssh \
strace \
sudo \
svn \
tree \
ufw \
virt-manager \
virt-sparsify \
zerofree \
zip \
)

echo "Installing extra system packages."
sudo apt install -y --force-yes ${install_packages[@]}

# Create an alphabetical list of packages to remove.
remove_packages=(\
gnome-games \
)

# Remove packages if needed.
echo "Removing unwanted packages."
sudo apt purge -y ${remove_packages[@]}
sudo apt autoremove
sudo apt autoclean

echo "Installing Python packages found in ${HOME}/workspace/python/requirements.txt"
pip install --user -r ${HOME}/workspace/python/requirements.txt
pip3 install --user -r ${HOME}/workspace/python/requirements.txt

echo "${0} script complete on `date +'%F at %r'`"
