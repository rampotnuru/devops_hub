#!/bin/bash

SERVICE="nginx"

systemctl is-active --quiet $SERVICE

if [ $? -ne 0 ]
then
    echo "$SERVICE is not running."
    echo "Restarting service..."

    systemctl restart $SERVICE

    echo "$SERVICE restarted."
else
    echo "$SERVICE is running."
fi
