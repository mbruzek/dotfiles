#!/bin/bash

# Install software for a new system.

set -x 

echo "Upgrading the packages on this system."
sudo dnf -y check-update

install_packages=(\
byobu \
chromium \
golang \
keepassx \
leafpad \
lm_sensors \
macchanger \
meld \
pastebinit \
pidgin \
yubikey-personalization-gui \
)

echo "Installing extra system packages."
sudo dnf -y install ${install_packages[@]}

sudo dnf -y install https://prerelease.keybase.io/keybase_amd64.rpm

# Remove packages if needed.

#sudo dnf -y remove thunderbird
