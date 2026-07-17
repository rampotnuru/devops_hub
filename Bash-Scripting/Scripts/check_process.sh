#!/bin/bash

PROCESS="nginx"

if pgrep $PROCESS > /dev/null
then
    echo "$PROCESS is running."
else
    echo "$PROCESS is not running."
fi
