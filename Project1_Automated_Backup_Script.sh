


#!/bin/bash

 ################################
 # Author: Atharv Nanaware
 # Version: v1 #
 # Aim: Create a script to automatically backup files or directories to a specified location.
 #################################

# Set the backup and source directory paths
backup_directory="backup/entity/path"
source_directory="path/to/source"

# Create a timestamp for the backup file name
timestamp=$(date +%Y%m%d%H%M%S)

# Check if the backup directory exists, if not create it
mkdir -p "$backup_directory"

# Create the backup using tar
tar -czf "$backup_directory/backup_$timestamp.tar.gz" -C "$(dirname "$source_directory")" "$(basename "$source_directory")"

# Check if tar was successful
if [ $? -eq 0 ]; then
  echo "Backup successful!"
else
  echo "Backup failed."
fi

