#!/bin/bash

# Declaring an Array and Assigning values
Linux[0]='Debian'
Linux[1]='Fedora'
Linux[2]='Ubuntu'
Linux[3]='SUSE'
Linux[4]='Slackware'

clear
echo Welcome to Linux distributions!
echo ""
for i in {1..5}; do
	echo $i"." ${Linux[i-1]}
done
# Initializing an array during declaration
declare -a LinuxArray=("Red Hat Enterprise Linux" CentOS "SUSE Linux Enterprise" Turbolinux "Scientific Linux")

# Print the Whole Bash Array
echo ""
echo Enterprise editions
echo ${LinuxArray[@]}

# Add an element to an existing Bash Array
echo
echo Unix editions
Unix=(Solaris AIX "BSD/OS");
Unix=("${Unix[@]}" IRIX "HP-UX" "Tru64 UNIX")
length=${#Unix[@]}
for ((i=1; i <= length; i++))
do
	echo $i. ${Unix[$i-1]}
done

# Written by Pavlin Georgiev
# November 2015
