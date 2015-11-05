#!/bin/bash
# Reads a list of Cisco switches and prepares list of commands for them
cat switch_list.in | while read line
do
   echo ssh $line
   echo "<password>"
   echo
   echo "enable"
   echo "<password>"
   echo "show cdp neighbors detail"
   echo
   echo "-------------------------"
done
