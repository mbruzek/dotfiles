#!/bin/bash

# This script speaks a greeting to the user.

# Get the current hour (24 hour clock format is 0-23)
HOUR=$(date +%H)

# When the hour is between 0 and 12 it is morning.
if [ $HOUR -ge 0 -a $HOUR -lt 12 ]; then
    TIME_OF_DAY="morning,"
elif [ $HOUR -ge 12 -a $HOUR -lt 18 ]; then
    # When the hour is greater than 12 and less than 18 it is afternoon
    TIME_OF_DAY="afternoon,"
else
    # When the hour is greater than 18 it is evening.
    TIME_OF_DAY="evening,"
fi
espeak -v en-us+f5 -s 155 -p 95 "Hello $USER what can I do for you this $TIME_OF_DAY?"
