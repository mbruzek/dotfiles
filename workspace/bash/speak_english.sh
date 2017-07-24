#!/bin/bash
# -v en/en-us+f5 uses the fifth US english female voice.
# -s 155 Specify 145 words per minute, default is 160
# -p 55 Pitch adjustment 0 to 99 default is 50
# 2> redirects the error messages to /dev/null
espeak -v en-us+f5 -s 155 -p 95 "$*" 2> /dev/null
#echo "$@"
