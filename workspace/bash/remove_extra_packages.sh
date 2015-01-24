#!/bin/bash

# This script removes unecessary packages from an Ubuntu system.

# Remove packages from a virtual system that are not likely to be used.
sudo apt-get remove aisleriot mahjongg gnome-sudoku gnomine -y
sudo apt-get remove brasero-common dvd+rw-tools -y
#sudo apt-get remove thunderbird -y
sudo apt-get remove empathy-common -y 
#sudo apt-get remove espeak-data espeak -y
sudo apt-get remove gwibber-service gwibber libgwibber2 -y
#sudo apt-get remove bluez bluez-cups pulseaudio-module-bluetooth telepathy-gabble gnome-bluetooth -y
sudo apt-get remove brltty -y
#apt-get remove wireless-tools wireless-regdb
sudo apt-get remove rhythmbox-data -y
#sudo apt-get remove libreoffice-core
sudo apt-get remove ubuntuone-client ubuntuone-installer -y
sudo apt-get purge shotwell simple-scan -y
# Remove the overlay scroll bar.
#sudo apt-get remove overlay-scrollbar liboverlay-scrollbar3-0.2-0 liboverlay-scrollbar-0.2-0
# Remove the global menu bar.
#sudo apt-get remove indicator-appmenu appmenu-gtk appmenu-gtk3 appmenu-qt
sudo apt-get autoremove 
