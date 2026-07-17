#!/bin/bash

echo "Enter directory path:"
read DIR

DATE=$(date +%Y%m%d)

tar -czvf logs_backup_$DATE.tar.gz "$DIR"/*.log

echo "Archive created successfully."
