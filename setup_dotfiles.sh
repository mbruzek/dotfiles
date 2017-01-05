#!/bin/bash

set -x

# This script installs the dotfiles repository to the user's home directory.

# Make a .backup of the .bashrc file and replace the history size.
sed -i.backup -e 's/HISTSIZE=.*$/HISTSIZE=-1/' ${HOME}/.bashrc
# Replace history file size with a numeric less than zero inhibits truncation.
sed -i -e 's/HISTFILESIZE=.*$/HISTFILESIZE=-1/' ${HOME}/.bashrc
# Check if the history time format already exists in the .bashrc file.
grep HISTTIMEFORMAT ${HOME}/.bashrc
if [ $? -ne 0 ]; then
    # Add the history time format to the end of the .bashrc
    echo -e HISTTIMEFORMAT=\"%F %r \" >> ${HOME}/.bashrc
else
    # Replace the history time format in the user's .bashrc
    sed -i -e 's/HISTTIMEFORMAT=.*&/HISTTIMEFORMAT=\"%F %r \"/' ${HOME}/.bashrc
fi
# Copy the bash_exports file.
cp -rv bash_exports ${HOME}/.bash_exports
# Check if the .bashrc sources the .bash_exports file.
grep bash_exports ${HOME}/.bashrc
if [ $? -ne 0 ]; then
  echo -e "if [ -f ~/.bash_exports ]; then" >> ${HOME}/.bashrc
  echo -e ". ~/.bash_exports" >> ${HOME}/.bashrc
  echo -e "fi" >> ${HOME}/.bashrc
fi
# Copy the bash_aliases file.
cp -rv bash_aliases ${HOME}/.bash_aliases

# Copy the .vimrc to the users home file.
cp .vimrc ${HOME}/.vimrc

if [ ! -d ${HOME}/workspace ]; then
    mkdir -p ${HOME}/workspace
fi
# Copy the bash scripts to the user's workspace directory.
cp -rv ./workspace ${HOME}/

mkdir -p -v ${HOME}/workspace/go/bin
mkdir -p -v ${HOME}/workspace/bundles
mkdir -p -v ${HOME}/workspace/charms
mkdir -p -v ${HOME}/workspace/interfaces
mkdir -p -v ${HOME}/workspace/layers

echo "The dotfiles repository has been set up successfully."
