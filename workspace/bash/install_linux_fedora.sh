#!/bin/bash

# Install software for a new system.

set -x 

echo "Upgrading the packages on this system."
sudo dnf -y upgrade

install_packages=(\
byobu \
chromium-browser \
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

# Remove packages if needed.


