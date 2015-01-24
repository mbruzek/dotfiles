#!/bin/bash

# A shell script that speaks the message "Good morning", "Good afternoon", 
# or "Good evening" time and date depending on when the script is run.
 
# Get the current hour (24 hour clock format is 0-23)
HOUR=$(date +%H)

# When the hour is between 0 and 12 it is morning.
if [ $HOUR -ge 0 -a $HOUR -lt 12 ]; then
    TIME_OF_DAY="morning,"
elif [ $HOUR -ge 12 -a $HOUR -lt 18 ]; then
    # When the hour is between 12 and 18 it is afternoon.
    TIME_OF_DAY="afternoon,"
else
    # When the hour is greater than 18 it is evening.
    TIME_OF_DAY="evening,"
fi
# Format the current time and date.
# %l = hour (1-12)
# %M = minute (00-59)
# %p = locale's equivalent of AM or PM, blank if unknown.
# %A = locale's full weekday name (Sunday)
# %B = locale's full month name (January)
# %e = day of month, space padded
# %Y = year
DATE_STRING=`date +"%l:%M %p, on %A %B %e, %Y"`
# -v en/en-us+f5 uses the fifth US english female voice.
# -s 145 Specify 145 words per minute, default is 160
# -p 65 Pitch adjustment 0 to 99 default is 50
# 2> redirects the error messages to /dev/null
espeak -v en-us+f5 -s 145 -p 65 ". Good $TIME_OF_DAY it is $DATE_STRING" 2> /dev/null
