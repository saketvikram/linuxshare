#!/bin/bash

ip_list_file=~/ip_list.in
results_file=~/ping_results.out

echo "===== BEGIN =====" > $results_file

cat $ip_list_file | while read ip_addr
do
   echo "Ping to " $ip_addr
   ping -c 3 $ip_addr >> $results_file
   echo "-------------------------------------------------" >> $results_file
done

echo "====== END ======" >> $results_file

view $results_file
