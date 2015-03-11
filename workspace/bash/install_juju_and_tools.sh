#!/bin/bash

# Install Juju packages and tools on a 15.04 system.
# This script was written on 02/25/2015.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
amulet \
charm-tools \
git \
juju-core \
juju-local \
)

# Create an alphabetical list of python packages to install.
pip_install=(bundletester juju-deployer)

read -p "Add the 'stable' or 'devel' Juju repository? " JUJU_REPOSITORY
if [[ -z $JUJU_REPOSITORY ]]; then
  JUJU_REPOSITORY="stable"
# JUJU_REPOSITORY="devel"
fi

# Create a list of repositories to add.
repositories=(ppa:juju/${JUJU_REPOSITORY})

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

git clone https://github/juju/plugins.git ~/.juju-plugins
echo 'PATH=$PATH:$HOME/.juju-plugins' >> .bashrc
source ~/.bashrc

echo "${0} script complete."

