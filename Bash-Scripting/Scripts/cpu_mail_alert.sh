#!/bin/bash

THRESHOLD=80

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}' | cut -d. -f1)

if [ "$CPU" -gt "$THRESHOLD" ]
then
    echo "CPU Usage is $CPU%" | mail -s "CPU Alert" pavanram.potnuru.com
fi

