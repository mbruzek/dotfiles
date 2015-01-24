#!/bin/bash
# Return a specific number of random alpha numeric characters.
# Parameter 1 must be a number.
BYTES=$1
if [ -z "$BYTES" ] 
then
   BYTES="16"
fi
< /dev/urandom tr -dc A-Za-z0-9 |head -c $BYTES
echo
