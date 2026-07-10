#!/bin/bash

read -p "Enter file name: " file

head -n -3 "$file" > temp.txt

mv temp.txt "$file"

echo "Last 3 lines removed."
