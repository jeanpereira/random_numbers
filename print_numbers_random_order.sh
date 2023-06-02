#!/bin/bash

###############
## Variables ##
###############
# Array to save the numbers. This array will control whether the number already exists to avoid repeating numbers.
_NUMBERS=()
# It's a loop control.
_CONTINUE=1
# Variable to skip number if already exists in the array _NUMBERS
_MATCH=0

while [ ${_CONTINUE} -eq 1 ]; do
    # Get a number randomly from 1 to 10
    _TEMP=$(( ${RANDOM} % 10 + 1 ))

    # Check if the number in _TEMP variable exists in the array _NUMBERS
    for _VALUE in ${_NUMBERS[@]}; do
        # If exists, change the _MATCH to 1
        if [ ${_VALUE} -eq ${_TEMP} ]; then
            _MATCH=1
        fi
    done

    # If the number don´t match, save in the array and print.
    if [ $_MATCH -eq 0 ]; then
        _NUMBERS+=(${_TEMP})
        echo ${_TEMP}
    else
        _MATCH=0
    fi

    # Check if the array have 10 numbers and stop the process.
    if [ ${#_NUMBERS[@]} -eq 10 ]; then
        _CONTINUE=0
    fi
done
