#!/bin/bash
# Read printers from a text file and ping each of them 3 times
# Results are writen to a file

input_file=~/pc_list.in
output_file=~/ping_results.out

echo In progress ...

echo "-------------- BEGIN -----------------" > $output_file

cat $input_file | while read line
do
echo "--------------------------------------" >> $output_file
echo "| IP address:" $line >> $output_file
echo "--------------------------------------" >> $output_file
  ping -c 3 -q $line >> $output_file
done
echo "---------------- END -----------------" >> $output_file

view $output_file 
