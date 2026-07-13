#!/bin/bash

THRESHOLD=80

MEMORY=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 *100}')

if [ "$MEMORY" -gt "$THRESHOLD" ]
then
    echo "Memory usage is $MEMORY%" | mail -s "Memory Alert" your_email@example.com
fi
