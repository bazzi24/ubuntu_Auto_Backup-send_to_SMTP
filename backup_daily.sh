#!/bin/bash

#Root directory to backup
SOURCE_DIR="Your root directory needs to be backed up"

#Directory backup
BACKUP_DIR="Folder to save backup"

#Today
DATE=$(date +'%Y-%m-%d')
BACKUP_FILE="backup-$DATE.tar.gz"

#Gmail receive notification
EMAIL="Your email"

#Create folder if doesn't exists
mkdir -p "$BACKUP_DIR"

#Perform backup

tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR"

#Check backup results
if [ $? -eq 0 ]; then
	echo -e "Subject: Backup sucessful - $DATE\n\nAlready save at: $BACKUP_DIR/$BACKUP_FILE" | msmtp "$EMAIL"
else 
	echo -e "Subject: Backup failed - $DATE\n\nBackup failed!" | msmtp "$EMAIL"
fi
