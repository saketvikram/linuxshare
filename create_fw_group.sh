#!/bin/bash
# Creates a group of firewall rules for iptables configuration
# The script accepts command-line parameters
# 1st - name of the new group
# 2nd - file name with description of allowed ports for network communication
# Actual firewall configuration is not changed, the results are output on the console
# Example
# $create_fw_group.sh my_new_group descr_file.in
# Contents of file "descr_file.in"
# dport		80	tcp
# dport		443	tcp
# Expected output
# -A my_new_group -p tcp --dport 80 -j ACCEPT
# -A my_new_group -p tcp --dport 443 -j ACCEPT
FW_GROUP_NAME=$1
DESCR_FILE=$2

# FW group name should be specified and description file should exist
if [ -n $FW_GROUP_NAME ]
then
    if [ -n $DESCR_FILE ]
    then
        if [ -f $DESCR_FILE ]
	then
	    # All prerequisites are completed
	    echo "# New firewall group - definition"
	    echo ":$FW_GROUP_NAME - [0:0]"
	    echo
	    # Reading the contents of the file with list of permitted network ports
	    cat $DESCR_FILE | while read line; do
		PORT_DIRECTION=`echo $line | cut -d" " -f1`
		PORT_NO=`echo $line        | cut -d" " -f2`
		PORT_TYPE=`echo $line      | cut -d" " -f3`
		# Composing the new firewall rule
		echo "-A $FW_GROUP_NAME	-p $PORT_TYPE --$PORT_DIRECTION $PORT_NO -j ACCEPT"
	    done
        else
	    echo "File with rules description does not exist."     
	fi
    else
	echo "File with rules description is not specified."
    fi
else
    echo "Firewall group name is not specified."
fi

# Author: Pavlin Georgiev
# May 2015
