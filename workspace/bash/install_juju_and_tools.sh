#!/bin/bash

# Install Juju packages and tools on a 15.04 system.
# This script was written on 02/25/2015.

set -x

# Create an alphabetical list of packages to install.
install_packages=(\
amulet \
charm-tools \
juju \
juju-deployer \
)

# Create an alphabetical list of python packages to install.
pip_install=(bundletester flake8 juju-deployer pip six tox)

read -p "Add the 'stable' or 'devel' Juju repository? " JUJU_REPOSITORY
if [[ -z $JUJU_REPOSITORY ]]; then
  JUJU_REPOSITORY="stable"
# JUJU_REPOSITORY="devel"
fi

# Create a list of repositories to add.
repositories=(ppa:juju/${JUJU_REPOSITORY})

echo "Adding repositories to the system."
for repository in "${repositories[@]}"; do
  sudo add-apt-repository -u -y "${repository}"
done

echo "Installing extra packages."
sudo apt-get install -y --force-yes ${install_packages[@]}

echo "Installing python packages."
sudo pip install -U ${pip_install[@]}

echo "${0} script complete."
