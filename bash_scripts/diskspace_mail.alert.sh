#!/bin/bash

THRESHOLD=80

DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK" -gt "$THRESHOLD" ]
then
    echo "Disk usage is $DISK%" | mail -s "Disk Alert" your_email@example.com
fi
