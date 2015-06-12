#!/bin/bash

# Install and remove packages on a 15.04 Ubuntu system.
# This script was written on 02/02/2015.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
ack-grep \
arj \
build-essential \
byobu \
bzr \
cabextract \
charm-tools \
chromium-browser \
curl \
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
ipython \
ipython3 \
juju-core \
juju-local \
keepassx \
leafpad \
lm-sensors \
# lxc-docker \
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

# Create an alphabetical list of python packages to install.
pip_install=(path.py requests)

# Create an alphabetical list of packages to remove.
remove_packages=( \
account-plugin-aim \
account-plugin-facebook \
account-plugin-flickr \
account-plugin-google
account-plugin-jabber \
account-plugin-salut \
account-plugin-windows-live \
account-plugin-yahoo \
aisleriot \
gnome-mahjongg \
gnome-sudoku \
unity-scope-clementine \
unity-scope-colourlovers \
unity-scope-gmusicbrowser \
unity-scope-guayadeque \
unity-scope-musicstores \
unity-scope-musique \
unity-scope-texdoc \
unity-scope-tomboy \
unity-scope-yelp \
unity-scope-zotero \
)

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

echo "${0} script complete."
