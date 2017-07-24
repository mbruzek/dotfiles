#!/bin/bash

REPO=/etc/apt/sources.list.d/google-chrome.list
if [ ! -f $REPO ]; then
  sudo sh -c "echo deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main >> $REPO"
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
fi

sudo apt-get -qq update
sudo apt-get install -y google-chrome-stable
