#!/bin/bash
# This script is going to backup chosen files and directories. 
# Then copies the backup file to remote location.

current_date=$(date +"%Y-%m-%d")
backup_file="backup_$current_date.tar.gz"
backup_server=147.251.96.1
app_settings_file="app_settings_$current_date.tar.gz"


echo $current_date

cd /home/georgiev

echo Creating backup $backup_file ...
tar -czf Backup/$backup_file Dokumenty/ \
Work/ \
instalace_zarizeni/ \
bin/*.sh -X exclude_list.txt 
# Exclude options: no video files, no archives, no temp files

if [ $? -eq 0 ]
then
	echo Backing up application settings $app_settings_file ...
	# Hidden folders in user's home dir starting with "."
	tar -czf Backup/$app_settings_file .[A-Za-z]* \
	--exclude='.cache' \
	--exclude='.thumbnails' --exclude='.thunderbird/*/ImapMail' \
	--exclude='.[A-Z]*/cache' 
else
	echo Backup of application settings failed.
fi

# If the archive operation completed succesfuly the script is copies the archive to remote location
if [ $? -eq 0 ]
then
  echo
  echo Done.
  ls -lh Backup/$backup_file
  ls -lh Backup/$app_settings_file
  echo
  echo Copying to remote server. Login credentials are required.
  scp Backup/$backup_file georgiev@$backup_server:Backup/
  scp Backup/$app_settings_file georgiev@$backup_server:Backup/
  if [ $? -eq 0 ]
    then
      echo "Success."
    else 
      echo "Error occured when copying remotely to server Ankh."
  fi
else
  echo "Error occured when archiving with tar. Exit code: $?"
fi
