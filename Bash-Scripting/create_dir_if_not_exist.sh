#!/bin/bash

echo "Enter file or directory name:"
read NAME

if [ -e "$NAME" ]
then
    echo "$NAME already exists."
else
    echo "Does not exist."

    echo "Create File (f) or Directory (d)?"
    read TYPE

    if [ "$TYPE" = "f" ]
    then
        touch "$NAME"
        echo "File created."
    elif [ "$TYPE" = "d" ]
    then
        mkdir -p "$NAME"
        echo "Directory created."
    else
        echo "Invalid choice."
    fi
fi
