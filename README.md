# dotfiles repository

### Problem

I am a developer who updates his operating system often. It takes me a while
to configure my system the way I like it. This repository is an attempt to
script the dot files and other configuration files that I use on an Ubuntu
Linux system to automate the process as much as possible.

## Install

From a fresh install of Ubuntu you have to install `git` and clone this
repository:

```shell
sudo apt-get install git
git clone https://github.com/mbruzek/dotfiles.git .dotfiles
cd .dotfiles
```

To install the dot files into your home directory run:

```shell
setup_dotfiles.sh
```

From there run any one of the install scripts in the `~/workspace/bash/`
directory.

```shell
~/workspace/bash/install_remove_ubuntu_packages.sh
```

## Please contribute!

Please create a pull request if you have something useful or interesting
to add.
