#!/bin/bash

THRESHOLD=80

MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

echo "Memory Usage: $MEMORY_USAGE%"

if [ "$MEMORY_USAGE" -gt "$THRESHOLD" ]
then
    echo "ALERT: Memory usage exceeded $THRESHOLD%"
else
    echo "Memory usage is normal."
fi
