#!/bin/bash
# Opens a list of IP addresses from a file
# Looks for the IP in ARP records at GW61 server
input_file=~/bin/ip_list.in
output_file=~/bin/arp_records.out

echo "----- BEGIN -----" > $output_file
cat $input_file | while read line
do
   grep $line /var/lib/arpwatch/*.dat >> $output_file
done
echo "----- END -----" >> $output_file
view $output_file
