#!/bin/bash
# Open the web page of each department of faculty of arts at Masaryk
# university

input_file=$HOME/list_of_departments.in

internet_browser=opera
faculty_web=http://phil.muni.cz

$internet_browser && sleep 5

cat $input_file | while read line
do
   department_web=$line
   # Opens the web page of each department specified in the list
   $internet_browser "$faculty_web/$department_web/"
done
