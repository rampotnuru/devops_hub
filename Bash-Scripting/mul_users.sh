#!/bin/bash

USERS=("john" "alice" "bob" "david")

for USER in "${USERS[@]}"
do
    sudo useradd $USER

    if [ $? -eq 0 ]
    then
        echo "User $USER created successfully."
    else
        echo "Failed to create $USER."
    fi
done
