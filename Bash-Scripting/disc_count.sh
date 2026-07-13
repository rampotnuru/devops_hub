#!/bin/bash

echo "Enter directory path:"
read DIR

FILES=$(find "$DIR" -type f | wc -l)
DIRS=$(find "$DIR" -type d | wc -l)
LINKS=$(find "$DIR" -type l | wc -l)

echo "Files       : $FILES"
echo "Directories : $DIRS"
echo "Symlinks    : $LINKS"
