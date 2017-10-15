#!/bin/bash

# This script copies cryptographic keys to a directory for backup purposes.

# Usage:
# To back up your own keys to a specific directory.
# $ backup_keys.sh /media/mbruzek/USB/keys
# To back up someone else's keys specify the username as the second argument.
# $ sudo backup_keys.sh /backup mbruzek

base_directory=${1}
hostname=$(hostname -f)
user=${2:-$USER}
user_targets=(
  .aws
  .gnupg
  .keepass
  .pki
  .ssh
)
# Create the output directory with the hostname and user.
output_directory=${base_directory}/${hostname}
mkdir -p ${output_directory}
# Loop through all the user targets and copy them to the output directory.
for target in ${user_targets[@]}; do
  directory="/home/${user}/${target}"
  if [ -d ${directory} ]; then
    # Use recursive to get all files and verbose to show where files are going.
    cp -v -r --parents ${directory} ${output_directory}
  else
    echo "'${directory}' does not exist."
  fi
done
cp -v -r --parents /etc/ssh ${base_directory}/${hostname}
cp -v -r --parents /etc/ssl/private ${base_directory}/${hostname}
echo "Keys saved to '${output_directory}'"
