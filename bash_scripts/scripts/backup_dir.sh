#!/bin/bash

read -p "Enter source directory " source
read -p "Enter backup directory " backup

timestamp=$(date +%Y%m%d_%H%M%S)

tar -cvzf "$backup/backup_$timestamp.tar.gz" "$source"

echo "Backup completed!"

