#!/bin/bash

# Install the dotfiles project to the user's home directory.

set -x 

# Check if the history time format already exists in the .bashrc file.
grep HISTTIMEFORMAT ${HOME}/.bashrc
if [ $? -ne 0 ]; then
    # Add the history time format to the end of the .bashrc
    echo -e HISTTIMEFORMAT=\"%F %r \" >> ${HOME}/.bashrc
else
    # Replace the history time format in the user's .bashrc
    sed -i -e 's/HISTTIMEFORMAT=.*&/HISTTIMEFORMAT=\"%F %r \"/' ${HOME}/.bashrc
fi

# Print the system information and normalize to lower case.
UNAME=$(uname | tr "[:upper:]" "[:lower:]")

# When this is a linux system determine the distribution.
if [ "$UNAME" == "linux" ]; then
    if [ -f /etc/os-release ]; then 
      # Search for ID in the /etc/os-release file.
      DISTRO=$(gawk -F= '/^ID/{print $2}' /etc/os-release)
    else
      # Search for ID in any release file.
      DISTRO=$(grep "^ID=" /etc/*release | cut -d= -f2)
    fi
fi
# Make sure a distribution could be found.
if [ -z "$DISTRO" ]; then
    echo "Unable to determine distribution for this system."
    exit 1
else
    # Normalize the string to lower case.
    DISTRO=$(echo $DISTRO | tr "[:upper:]" "[:lower:]")
fi

cp -rv bash_aliases ${HOME}/.bash_aliases
cp -rv bash_exports ${HOME}/.bash_exports
cp -rv .vimrc ${HOME}/.vimrc

mkdir -p -v ${HOME}/workspace
mkdir -p -v ${HOME}/workspace/go/bin

cp -rv ./workspace ${HOME}/

# Run the install script for this distribution.
echo "Running installer for ${UNAME}_${DISTRO}"
${HOME}/workspace/bash/install_${UNAME}_${DISTRO}.sh
