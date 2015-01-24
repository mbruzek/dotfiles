#!/bin/bash

# Configure a new Ubuntu install for work.
# This script was written on 01/08/2014 for Ubuntu 13.10.

set -ex

read -p "Add the stable or devel Juju repository? " JUJU_REPOSITORY
if [[ -z $JUJU_REPOSITORY ]]; then
  JUJU_REPOSITORY="stable"
# JUJU_REPOSITORY="devel"
fi

# Add the Juju repository.
#sudo add-apt-repository -y ppa:juju/$JUJU_REPOSITORY

# Add the Google Talk repository.
#sudo add-apt-repository -y 'deb http://dl.google.com/linux/talkplugin/deb/ stable main'

# Update the software packages after repository changes.
sudo apt-get -qq update 

# Remove the games.
sudo apt-get purge -y aisleriot gnome-games-data gnome-mahjongg gnome-sudoku 

# Install development tools.
sudo apt-get install -y build-essential bzr git markdown golang-go mercurial

# Install byobu terminal emulator.
sudo apt-get install -y byobu

# Install Chromium.
sudo apt-get install -y chromium-browser

# Install Docker.
sudo apt-get install -y docker.io

# Install enigmail a cryptography plugin for Thunderbird.
sudo apt-get install -y enigmail

# Install espeak.
sudo apt-get install -y espeak

# Install the Adobe flash plugin.
sudo apt-get install -y flashplugin-installer

# Install the Google hangout plugin.
sudo apt-get install -y google-talkplugin

# Install indicators.
sudo apt-get install -y indicator-multiload

# Install Inkscape for SVG graphics.
sudo apt-get install -y inkscape

# Install Juju, Charm-tools.
sudo apt-get install -y juju-core juju-local charm-tools 
#sudo apt-get install -y amulet

# Install Leafpad.
sudo apt-get install -y leafpad

# Hardware temperature sensors.
sudo apt-get install -y lm-sensors

# Install the macchanger that enables rewriting the MAC address.
sudo apt-get install -y macchanger

# Install meld the diff tool.
sudo apt-get install -y meld

# Install file decompression utilities.
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

# Install python and other tools.
sudo apt-get install -y python3 ipython3 python3-requests python3-setuptools python3-flake8 python-virtualenv python-dev

# Install QEMU virtualization.
sudo apt-get install -y qemu-kvm qemu-system virt-manager 

# Make sure ssh is installed.
sudo apt-get install -y ssh

# Install synaptic package manager.
sudo apt-get install -y synaptic

# Install uncomplicated fire wall (ufw).
sudo apt-get install -y ufw gufw

# Install VIM.
sudo apt-get install -y vim vim-gnome

# Install the yubikey software.
sudo apt-get install -y yubikey-personalization

# this should also go to bashrc
echo "export GPGKEY=%GPGKEY_ID" 
