# The dotfiles repository

### Problem

Updating the operating system or installing a new computer takes a long time
to configure the system the way I like it. This repository is an attempt to
automate the installation and configuration of the software of
Linux systems to speed up the process as much as possible.

## Prerequisites

You will need to clone the repository to set up the dot files.

### The `git` command
Install `git` so you can clone the repository:

```shell
sudo apt-get install git
```

or

```shell
sudo dnf install git
```

Then clone the dotfiles repository:

```shell
git clone https://github.com/mbruzek/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
## Setup

To install the dot files into your home directory run the setup command:

```shell
./setup.sh
```

The setup script will run a distribution specific install script to set up
your system, or exit in error. If the release of the operation system has not
been created yet you can copy from one of the previous releases.

After that run any one of the other scripts in the `~/workspace/bash/`
directory.

```shell
~/workspace/bash/pidgin_setup.sh
```

## Please contribute!

Do you have a different way to automate a new Linux desktop? Do you have
different patterns that are not covered here? Please contribute these
ideas here! Create an issue or a pull request if you have something
useful or interesting to add.
