#!/bin/bash
echo Opening config file of Apache HTTP server
echo echo "/etc/httpd/conf/httpd.conf"
sleep 3
sudo vim /etc/httpd/conf/httpd.conf
# Checking the exit status
if [ $? -eq 0 ]
then
	apachectl configtest
	
else
	echo "Error has occured when editing onfig file of Apache HTTP server."
fi 
