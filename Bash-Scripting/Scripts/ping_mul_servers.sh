#!/bin/bash

SERVERS=("google.com" "amazon.in" "github.com" "18.61.163.108")

for SERVER in "${SERVERS[@]}"
do
    ping -c 2 $SERVER > /dev/null

    if [ $? -eq 0 ]
    then
        echo "$SERVER : Reachable"
    else
        echo "$SERVER : Unreachable"
    fi
done
