#!/bin/bash

set -o xtrace

mkdir -p -v ${HOME}/.purple/sounds/
which espeak
if [ $? == 0 ]; then
  espeak -v en-us+f5 -s 155 -p 95 -w ${HOME}/.purple/sounds/attention.wav attention
  espeak -v en-us+f5 -s 155 -p 95 -w ${HOME}/.purple/sounds/bruzer.wav bruzer
  espeak -v en-us+f5 -s 155 -p 95 -w ${HOME}/.purple/sounds/message.wav message
  espeak -v en-us+f5 -s 155 -p 95 "Sound files created. Now use them in pidgin"
else
  echo "espeak is not installed."
  exit 1
fi
