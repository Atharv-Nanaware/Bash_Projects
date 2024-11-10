#!/bin/bash


##########################################

Author : Atharv

Version :2

Objective:
	Write a script to backup a database and compress the backup file.



#####################################################

# Configuration
DB_NAME="your_database_name"           # Name of the database to backup
DB_USER="your_db_username"             # Database username
DB_HOST="localhost"                    # Database host (e.g., localhost)
BACKUP_DIR="/path/to/backup"           # Directory to store backups
DATE=$(date +'%Y-%m-%d_%H-%M-%S')      # Timestamp for backup filename
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql"
COMPRESSED_FILE="${BACKUP_FILE}.gz"    # Compressed backup filename

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Step 1: Create the database backup
echo "Starting backup for database: $DB_NAME"
if mysqldump -u "$DB_USER" -h "$DB_HOST" "$DB_NAME" > "$BACKUP_FILE"; then
    echo "Database backup completed successfully: $BACKUP_FILE"
else
    echo "Error: Database backup failed!"
    exit 1
fi

# Step 2: Compress the backup file
echo "Compressing backup file..."
if gzip "$BACKUP_FILE"; then
    echo "Backup file compressed: $COMPRESSED_FILE"
else
    echo "Error: Failed to compress backup file!"
    exit 1
fi

# Optional: Remove old backups (e.g., keep only last 7 backups)
find "$BACKUP_DIR" -type f -name "${DB_NAME}_*.sql.gz" -mtime +7 -exec rm {} \;
echo "Old backups cleaned up."

# Completion message
echo "Backup process completed successfully."

# Optional: Send notification (email, Slack, etc.) on successful backup
send_notification() {
    # Add your notification code here, e.g., mail, Slack API, etc.
    echo "Notification sent: Backup of $DB_NAME completed at $DATE"
}
send_notification

	
