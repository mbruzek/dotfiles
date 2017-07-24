#!/bin/bash

REPO=/etc/yum.repos.d/google-chrome.repo
if [ ! -f $REPO ]; then
  sudo -i echo "[google-chrome]" > $REPO
  sudo -i echo "name=google-chrome - 64-bit" >> $REPO
  sudo -i echo "baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64" >> $REPO
  sudo -i echo "enabled=1" >> $REPO
  sudo -i echo "gpgcheck=1" >> $REPO
  sudo -i echo "gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" >> $REPO
  sudo -i curl -o /tmp/google_linux_signing_key.pub https://dl-ssl.google.com/linux/linux_signing_key.pub
  sudo -i rpm --import /tmp/google_linux_signing_key.pub
fi

sudo dnf check-update
sudo dnf install -y google-chrome
