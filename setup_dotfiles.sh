#!/bin/bash
set -ex

# This script installs the dotfiles repository to the user's home directory.

# Make a .backup of the .bashrc file and replace the history size.
sed -i.backup -e 's/HISTSIZE=.*$/HISTSIZE=-1/' $HOME/.bashrc
# Replace history file size with a numeric less than zero inhibits truncation.
sed -i -e 's/HISTFILESIZE=.*$/HISTFILESIZE=-1/' $HOME/.bashrc
# Check if the history time format already exists in the .bashrc file. 
grep HISTTIMEFORMAT $HOME/.bashrc
if [ $? -ne 0 ]; then
    # Add the history time format to the end of the .bashrc
    echo HISTTIMEFORMAT=\"%F %r \" >> $HOME/.bashrc
else
    # Replace the history time format in the user's .bashrc
    sed -i -e 's/HISTTIMEFORMAT=.*&/HISTTIMEFORMAT=\"%F %r \"' $HOME/.bashrc
fi

# Copy the .vimrc to the users home file.
cp .vimrc $HOME/.vimrc

if [ ! -d $HOME/workspace/bash ]; then
    mkdir -p $HOME/workspace/bash
fi
# Copy the bash scripts to the user's workspace/bash directory.
cp ./workspace/bash/* $HOME/workspace/bash/

echo "The dotfiles repository has been set up successfully."
