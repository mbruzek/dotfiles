#!/bin/bash
# This script measures the number of seconds it takes a command to execute.
# The first parameter must be the command to execute.

# Get start seconds.
START=$(date +%s)
echo "Starting command $1"

$1

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds to execute the command $1"
