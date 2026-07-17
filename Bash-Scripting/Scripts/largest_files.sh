#!/bin/bash

echo "Enter directory path:"
read DIR

find "$DIR" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -5

