# The dotfiles repository

### Problem

Updating the operating system or installing a new computer takes a long time
to configure the system the way I like it. This repository is an attempt to
automate the installation and configuration of the software on an Ubuntu
Linux system to speed up the process as much as possible.

## Install

From a fresh install of Ubuntu follow these steps:

Update the packages and resolve any errors:
```shell
sudo apt-get update
sudo apt-get upgrade
```

Then clone the dotfiles repository:

```shell
sudo apt-get install git
git clone https://github.com/mbruzek/dotfiles.git .dotfiles
cd .dotfiles
```

To install the dot files into your home directory run:

```shell
./setup_dotfiles.sh
```

From there run any one of the install scripts in the `~/workspace/bash/`
directory.

```shell
~/workspace/bash/install_remove_ubuntu_packages.sh
```

## Please contribute!

Do you have a different way to automate a new Linux desktop? Do you have
different patterns that are not covered here? Please contribute these
ideas here! Create an issue or a pull request if you have something 
useful or interesting to add.
