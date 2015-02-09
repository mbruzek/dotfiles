#!/bin/bash

# Backup the packages, the repositories, and the repository keys. 

VERSION=`lsb_release -rs`
ARCH=`uname -m`
TARGET_DIRECTORY=workspace/resources/${ARCH}/${VERSION}

if [ ! -d $TARGET_DIRECTORY ]; then
    mkdir -p $TARGET_DIRECTORY
fi
# Save off the packages.
dpkg --get-selections > ${TARGET_DIRECTORY}/dpkg_selections
# Save off the apt repositories.
sudo cp -Rv /etc/apt/sources.list* ${TARGET_DIRECTORY}/
# Export all the repository keys.
sudo apt-key exportall > ${TARGET_DIRECTORY}/exported_repository.keys
# Remotely sync the files from the user's directory.
#rsync -avr /home/${USER} workspace/resources/${USER}

echo "Saved packages to ${TARGET_DIRECTORY}"

