#!/bin/bash

# Install the dotfiles project to the user's home directory.

set -x

UNAME=$(uname)

# When this is a Linux system determine the ID and RELEASE.
if [ "$UNAME" == "Linux" ]; then
    which lsb_release
    if [ $? == 0 ]; then
        ID=$(lsb_release -i -s)
        RELEASE=$(lsb_release -r -s)
    else
        echo "The lsb_release utility was not found."
        exit 1
    fi
else
    echo "Not a Linux system."
    exit 2
fi

# Check if the history time format already exists in the .bashrc file.
grep HISTTIMEFORMAT ${HOME}/.bashrc
if [ $? -ne 0 ]; then
    # Add the history time format to the end of the .bashrc
    echo -e HISTTIMEFORMAT=\"%F %r \" >> ${HOME}/.bashrc
else
    # Replace the history time format in the user's .bashrc
    sed -i -e 's/HISTTIMEFORMAT=.*&/HISTTIMEFORMAT=\"%F %r \"/' ${HOME}/.bashrc
fi

cp -rv bash_aliases ${HOME}/.bash_aliases
cp -rv bash_exports ${HOME}/.bash_exports
cp -rv .vimrc ${HOME}/.vimrc

mkdir -p -v ${HOME}/workspace
mkdir -p -v ${HOME}/workspace/go/bin

cp -rv ./workspace ${HOME}/

# Run the install script for this distribution.
echo "Running install script for ${UNAME}_${ID}_${RELEASE}"
${HOME}/workspace/bash/install_${UNAME}_${ID}_${RELEASE}.sh

echo "Setup complete for ${UNAME} ${ID} ${RELEASE} run any additional scripts as needed."
