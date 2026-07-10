#!/bin/bash

if systemctl is-active --quiet nginx
then
    echo "Nginx is running."
else
    echo "Nginx is stopped."
    sudo systemctl start nginx
    echo "Nginx started successfully."
fi
