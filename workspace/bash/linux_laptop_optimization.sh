#!/bin/bash

# This script helps set up a Linux laptop with power saving abilities for longer 
# battery life.

# https://wiki.archlinux.org/index.php/Solid_State_Drives

echo "This script helps optimize the battery of a Linux laptop computer."
echo 

if [[ $UID -ne 0 ]]; then
   echo "$0 must be run as root."
   exit 1
fi

echo "An solid-state drive (SSD) uses much less power than the traditional hard drive."
echo "Linux can be optimized to use the SSD more efficiently too."
echo "Edit your fstab file to disable write last access time and enable TRIM."

echo "Making a backup of your fstab file"
cp /etc/fstab{,.backup}
echo
echo "If possible disable writing the last access time to files and directories."
echo "Add noatime,nodirtime as options to the partition on the solid-state drive."
echo
echo "TRIM command allows an operating system to inform a solid-state drive (SSD)"
echo "which blocks of data are no longer considered in use and can be wiped internally."
echo "Enable TRIM by using the discard option on the SSD partition."
echo "More information on TRIM can be found at: http://en.wikipedia.org/wiki/TRIM"
echo "I do not know how to script this so this exercise will be left to the user."
echo

echo "You can also create RAM disks for temporary filesystems, that will be erased when powered down"
echo "Add these tempfs in the /etc/fstab file to persist the changes."
echo "With this change the /tmp directory will not persist files past a reboot."
echo "tmpfs /tmp tmpfs defaults,noatime,size=512M,mode=1777 0 0" >> /etc/fstab
echo "With this change the /var/spool directory will not persist past a reboot."
echo "tmpfs /var/spool tmpfs defaults,noatime,size=512M,mode=1777 0 0" >> /etc/fstab
echo "If you do not care about log files after a reboot, you can make a tempfs for the log directory."
echo "tmpfs /var/log tmpfs defaults,noatime,size=512M,mode=0755 0 0"
echo "Note: The size (512M) is not allocated immediately, only as needed."
echo

echo "Another way to save disk accesses is not to use swap space until physical memory is full."
free 
echo "This is referred to as swappiness.  The old swappiness value is: "
cat /proc/sys/vm/swappiness 
echo 1 > /proc/sys/vm/swappiness
echo "sudo echo 1 > /proc/sys/vm/swappiness" >> /etc/init.d/rc.local
echo "vm.swappiness=1" >> /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf

echo "Power top shows processes that are running and consuming the most power."
apt-get install -y powertop 
echo "Laptop-Mode has many values that prevent power wasting operations such as "
echo "preventing HDD from spinning up constantly."
apt-get install -y laptop-mode-tools 
echo "The main configuration file is /etc/laptop-mode/laptop-mode.conf"
cp /etc/laptop-mode/laptop-mode.conf{,.backup}
grep ENABLE_LAPTOP_MODE /etc/laptop-mode/laptop-mode.conf 
update-rc.d laptop-mode defaults

echo "Sensors is used to show the current readings for all sensor chips."
apt-get install -y lm-sensors
echo "Thinkfan is a simple fan control program."
apt-get install -y thinkfan
cat /proc/acpi/ibm/fan
echo "Creating the file that will enable thinkfan to work."
echo "options thinkpad_acpi fan_control=1" > /etc/modprobe.d/thinkfan.conf 
echo "To configure think fan edit the sensor value in: /etc/thinkfan.conf"
echo "On the W500 and T410 the temperature file is located in :"
echo "/sys/devices/virtual/thermal/thermal_zone0/temp"
echo "For more information go to: http://www.thinkwiki.org/wiki/How_to_control_fan_speed"


