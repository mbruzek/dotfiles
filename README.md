# The dotfiles repository

## Problem statement

As a software engineer I have to load a lot of Linux systems that process
can take a long time to get the system the way I like to use it.

## Solution

This repository is an attempt to automate the installation and configuration
of the software of Linux systems to speed up the process as much as possible.

## Prerequisites

This repository assumes you are using a Linux system and running a BASH shell.
You must also have `git` installed to clone the repository.

## Install

Clone the repository and run setup to configure the system.

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

Do you have a different way to automate a new Linux desktop? Please let me
know. Do you have different patterns that are not covered by this repository?
Please contribute ideas [here](https://github.com/mbruzek/dotfiles/issues)! 
Create an issue or a pull request if you have something useful or interesting
to add.
