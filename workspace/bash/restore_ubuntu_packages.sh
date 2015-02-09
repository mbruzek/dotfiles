#!/bin/bash

# Restore the repositiories, keys, and packages from a backup.

VERSION=`lsb_release -rs`
ARCH=`uname -m`
TARGET_DIRECTORY=workspace/resources/${ARCH}/${VERSION}

if [ ! -d $TARGET_DIRECTORY ]; then
    echo "The ${TARGET_DIRECTORY} does not exist!"
    exit(1);
fi

echo "Restored packages from ${TARGET_DIRECTORY}"

# Remotely sync the files from the user's directory.
#rsync -avr workspace/resources/${USER} /home/${USER}

echo "Adding the repository keys from ${TARGET_DIRECTORY}/exported_repository.keys"
sudo apt-key add -y ${TARGET_DIRECTORY}/exported_repository.keys

echo "Adding the repositiory locations from ${TARGET_DIRECTORY}/sources.list*"
sudo cp -Rv ${TARGET_DIRECTORY}/sources.list* /etc/apt/

# Update the apt-get package list.
sudo apt-get update
# Install the Debian package tool dselect.
sudo apt-get install -y dselect
# Select all the packages found in the dpkg_selection file.
sudo dpkg --set-selections --configure < ${TARGET_DIRECTORY}/dpkg_selections
# Run the Debian package tool dselect.
#sudo dselect

echo "Restoring packages complete."

