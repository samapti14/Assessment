#!/bin/basih

# Variables
SOURCE_DIR="/home/ubuntu"         
REMOTE_USER="git"                
REMOTE_SERVER="github.com"       
REMOTE_REPO="samapti14/Assessment.git"
REMOTE_DIR="/tmp/repo_backup"

echo "[$TIMESTAMP] Starting backup from $SOURCE_DIR to $REMOTE_SERVER:$REMOTE_DIR"
rsync -avz --delete $SOURCE_DIR $REMOTE_USER@$REMOTE_SERVER:$REMOTE_DIR 

if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
    echo "Backup completed successfully."
else
    echo "Backup failed."
    echo "Backup failed. Please check the log for details."
fi
