#!/bin/bash
# Reads a text file line by line and create DHCP records
# Each line contains parameters in the following order
# 1st - host name
# 2nd - IP address
# 3rd - MAC address in format aa:bb:cc:dd:ee:ff
# 4th - switch name where the device is connected
# 5th - port name of the switch

input_file=~/host_list.in
output_file=~/dhcp_record_list.out

# Creates new output file, if exists overwrites its contents
echo -n > $output_file

# Reading host list line by line
while read line
do
	create_dhcp_record.sh $line >> $output_file
done < $input_file

vim $output_file
