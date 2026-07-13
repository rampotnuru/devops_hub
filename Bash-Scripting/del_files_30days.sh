#!/bin/bash

DIRECTORY="/tmp"

find $DIRECTORY -type f -mtime +30 -exec rm -f {} \;

echo "Old files deleted successfully."
