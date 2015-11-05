#!/bin/bash

# Demostration of shell redirection

echo Redirecting from a file to the console
cat < /etc/passwd
echo
read key

echo Sorted view of the file
sort < /etc/passwd
echo
read key

echo Listing directory contents to a temp file
ls -l $HOME/ > /tmp/output.txt
ls -l /tmp/output.txt
echo
read key
cat /tmp/output.txt
echo
read key

/*
echo Listing all PDF files in home dir and subdirs ...
find $HOME/ -iname "*.pdf" 2> /tmp/pdf_errors.log
cat pdf_errors.log
echo
read key
*/

echo Searching in the password file for \"georgiev\"...
grep georgiev /etc/passwd && echo "Georgiev found." || "Georgiev not found."
echo
echo ... and now grepping in the same file but without output.
echo Discarding unwanted output ... to /dev/null
read key
grep georgiev /etc/passwd > /dev/null && echo "Georgiev found." || "Georgiev not found."

PASSWD_FILE=/etc/passwd

# Get user name
read -p "Enter a user name : " username

grep -w "^$username" $PASSWD_FILE > /dev/null

# Check exit status
status=$?

if [ $status -eq 0 ]
then
    echo "User $username found in $PASSWD_FILE file."
else
    echo "User $username not found in $PASSWD_FILE file."
fi

# Written by Pavln Georgiev
# November 2015
# Used sources: http://bash.cyberciti.biz
