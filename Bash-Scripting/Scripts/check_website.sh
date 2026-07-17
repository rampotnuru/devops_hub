#!/bin/bash

echo "Enter URL:"
read URL

STATUS=$(curl -L -o /dev/null -s -w "%{http_code}" "$URL")

if [ "$STATUS" -lt 400 ]
then
    echo "$URL is UP (HTTP $STATUS)"
else
    echo "$URL is DOWN (HTTP $STATUS)"
fi
