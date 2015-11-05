#!/bin/bash

# This scripts is going to backup the virtual hard drive of a VM
# Let's assume that the storage for VM is the same
# Only file name differs. It is taken from command-line as parameter

VM_LOCATION=/home/georgiev/VM
VM_FILE=$1
BACKUP_LOCATION=/home/georgiev/Backup
BACKUP_FILE=$VM_FILE.tar.gz

echo $VM_FILE
if [ -f "$VM_LOCATION/$VM_FILE" ] 
then
	echo "Backing up" $VM_LOCATION/$VM_FILE.
	echo "Local backup location:" $BACKUP_LOCATION
	echo
	echo Backing up the virtual hard disk ...
	tar -czvf $BACKUP_LOCATION/$BACKUP_FILE $VM_FILE
	if [ $? -eq 0 ]
	then
		echo Backup of virtual hard drive was succesful.
		# Checking file size after backup
		echo Size before backup is `ls -lh $VM_LOCATION/$VM_FILE | cut -d" " -f5`
		echo Size after backup is `ls -lh $BACKUP_LOCATION/$BACKUP_FILE | cut -d" " -f5`
	else
		echo Error during backup.
	fi
else
	echo File $VM_FILE does not exist.
fi
