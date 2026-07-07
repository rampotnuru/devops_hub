#!/bin/bash

read -p "Enter the directory name/path: " dir

if [ -d "$dir" ]
then
	echo "Directory exists!"
else
	echo "Directory not found!!!"
fi

