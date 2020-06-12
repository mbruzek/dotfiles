#!/bin/bash

# Install software for a new Debian Linux system.
# This script was updated on 07/23/2019.

set -x

echo "Upgrading the packages on this system."
sudo apt update -qq

install_packages=(\
ack \
apt-transport-https \
bridge-utils \
byobu \
bzip2 \
cgroup-bin \
chromium \
cups \
curl \
cifs-utils \
debootstrap \
dnsutils \
ebtables \
espeak \
gdb \
gddrescue \
genisoimage \
gnupg \
gpm \
gvfs-bin \
hexedit \
htop \
imvirt \
iptables-persistent \
joe \
keepassx \
libgconf-2-4 \
libguestfs-tools \
linuxlogo \
lshw \
macchanger \
meld \
neofetch \
ntp \
ntpdate \
nvidia-detect \
nvidia-driver \
parted \
passwordsafe \
pastebinit \
pcscd \
pidgin \
pidgin-sipe \
pigz \
python3-pip \
qemu-kvm \
qemu-system \
qemu-utils \
ripgrep \
samba \
sdparm \
shellcheck \
sshpass \
ssh-askpass \
strace \
sudo \
tcpdump \
tree \
ufw \
vim \
vim-tiny \
virt-manager \
virtinst \
vlan \
wget \
whois \
winbind \
zerofree \
zip \
)

echo "Installing extra system packages."
sudo apt install -y --fix-broken ${install_packages[@]}

# Create an alphabetical list of packages to remove.
remove_packages=(\
gnome-games \
)

# Remove packages if needed.
echo "Removing unwanted packages."
sudo apt purge -y ${remove_packages[@]}
sudo apt autoremove -y
sudo apt autoclean

echo "Installing Python packages found in ${HOME}/workspace/python/requirements.txt"
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
