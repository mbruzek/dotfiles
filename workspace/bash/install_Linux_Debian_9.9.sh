#!/bin/bash

# Install software for a new Debian Linux system.
# This script was updated on 05/30/2019.

set -x

echo "Upgrading the packages on this system."
sudo apt update -qq

install_packages=(\
ack \
apt-transport-https \
byobu \
chromium \
cups \
curl \
cifs-utils \
espeak \
gdb \
golang-go \
hexedit \
imvirt \
iptables-persistent \
keepassx \
leafpad \
libguestfs-tools \
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
qemu-utils \
ssh \
ssh-askpass \
strace \
sudo \
tree \
ufw \
virt-manager \
virtinst \
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
sudo apt purge -y --force-yes ${remove_packages[@]}
sudo apt autoremove
sudo apt autoclean

echo "Installing Python packages found in ${HOME}/workspace/python/requirements.txt"
pip install --user -r ${HOME}/workspace/python/requirements.txt
pip3 install --user -r ${HOME}/workspace/python/requirements.txt

# Check if path already exists in the .bashrc file.
grep "^PATH" ${HOME}/.bashrc
if [ $? -ne 0 ]; then
    # Add the local python path to the .bashrc file.
    echo -e PATH=${PATH}:${HOME}/.local/bin >> ${HOME}/.bashrc
else
    # Replace the local python path in the user's .bashrc
    sed -i -e 's|^PATH=.*|PATH=${PATH}:${HOME}/.local/bin|' ${HOME}/.bashrc
fi

echo "${0} script complete on `date +'%F at %r'`"
