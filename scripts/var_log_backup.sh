#!/bin/bash

# Verify script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script using sudo."
    exit 1
fi

BACKUP_DIR="/backup"

DATE=$(date +%Y-%m-%d)

mkdir -p $BACKUP_DIR

tar -czvf $BACKUP_DIR/log_backup_$DATE.tar.gz /var/log

echo "Backup completed successfully."
