#!/bin/bash

set -e

URL=https://docs.docker.com
REPO=${URL}/engine/installation/linux/repo_files/fedora/docker.repo
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo ${REPO}
sudo mkdir -p /var/lib/docker # docker-engine-selinux issue
sudo dnf install -y docker-engine
sudo systemctl start docker
sudo systemctl enable docker

# Add docker group for running docker without sudo.
sudo groupadd docker
sudo gpasswd -a "${USER}" docker
# Log into the new group.
newgrp docker
