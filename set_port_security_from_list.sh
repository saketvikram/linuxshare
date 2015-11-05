#!/bin/bash
#

input_file=$HOME/switch_ports.in
input_file_sorted=/tmp/switch_ports_sorted.tmp
output_file=$HOME/port_security_setup.out

# Erases the contents of the output file
echo -e > $output_file

# Sorts the input file by firt column
sort $input_file -t" " -k1,2 > $input_file_sorted

cat $input_file_sorted | while read line
do
	# Executing another script to write port security commands	
	set_port_security.sh $line >> $output_file
done


vim $output_file

rm --force $input_file_sorted

# Written by Pavlin Georgiev
# October 2015
