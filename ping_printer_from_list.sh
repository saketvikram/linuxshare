#!/bin/bash
# Read printers from a text file and ping each of them 3 times
# Results are writen to a log file
cat Printer_list.txt | while read line
do
  ping -c 3 -q $line
done
