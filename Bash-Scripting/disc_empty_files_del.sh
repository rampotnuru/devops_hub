#!/bin/bash

echo "Enter directory path:"
read DIR

EMPTY_FILES=$(find "$DIR" -type f -empty)

echo "Empty Files Found:"
echo "$EMPTY_FILES"

echo ""
echo "Delete them? (yes/no)"
read CHOICE

if [ "$CHOICE" = "yes" ]
then
    find "$DIR" -type f -empty -delete
    echo "Empty files deleted."
else
    echo "Operation cancelled."
fi
