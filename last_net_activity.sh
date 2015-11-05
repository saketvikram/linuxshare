#!/bin/bash
# Searching in the ARP records for specific IP address
# The goal is to find last network activity of a host

input_file=~/bin/ip_addr_list.in
output_file=~/bin/net_history.out

echo "----- BEGINNING -----" > $output_file
cat $input_file | while read line
do
   #Searching in the ARP records of server GW61
   grep -w $line /var/lib/arpwatch/*.dat >> $output_file
done
echo "-------- END --------" >> $output_file
cat $output_file | more
