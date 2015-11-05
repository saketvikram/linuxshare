#!/bin/bash

# Demonstrating loops in bash

# for loop
for i in 1 2 3 4 5
do
   echo "Welcome $i times."
done

echo
echo A list of cars
for car in Mercedes BMW VW Opel Ford Toyota Nissan Hyundai Mitsubishi Renault Pegeot Citroen
do
   echo -n $car" "
done
echo

echo
echo A list of basic Linux commands
for command in ls cp mv ln touch rm mkdir rmdir chown chmod df du find tar rsync
do
   echo -n $command" "
done
echo

# Reading flie contents in a for loop
files="/etc/passwd /etc/group /etc/shadow /etc/gshow"
for f in $files
do
   [ -f $f ] && echo "$f was found" || echo "*** Error - $f file is missing."
done

echo 
# The for loop using command-line arguments
[ $# -eq 0 ] && { echo "Usage: $0 file1 file2 fileN"; exit 1; }
for f in $*
do
   echo
   echo "< $f >"
   [ -f $f ] && cat $f || echo "$f not file."
   echo "-----------------------------------"
done

echo "Printing file names in /tmp directory"
for f in $(ls /tmp/*)
do
	echo $f
done
echo

# Loop for calculations
echo "Even numbers:"
for i in {1..10}
do
	echo "2 * $i = $(($i * 2))"
done
echo

# Nested loops like in C++
for (( i = 1; i <= 5; i++ )) # Outer loop
do
   for (( j=1; j<=5; j++ )) # Inner loop
   do
	echo -n $i
   done
   echo
done
echo

read key



# while loop
n=1
while [ $n -le 5 ]
do
	echo "Testing while loop $n times."
	n=$(( n+1 ))
done
echo


echo Reading file contents with while loop
file=/etc/resolv.conf
while IFS= read -r line
do
    echo $line
done < "$file"
echo

echo Reading a text file with separate fields
file=/etc/resolv.conf
while IFS=' ' read -r f1 f2
do
    echo "field #1 : $f1 ==> field #2 : $f2"
done < "$file"
echo
read key

file=/etc/passwd
while IFS=: read -r user enpass uid gid desc home shell
do
    [ $uid -ge 500 ] && echo "User $user ($uid) assigned \"$home\" home directory with $shell."
done < "$file"
echo
read key

# Until loop
echo Demonstrating until loop
t=10
until [ $t -lt 0 ]
do
    echo "Water temperature is $t degree Celsius."
    t=$(( t-1 ))
done
echo "The water has frozen."
echo
echo Now quick warming up ...

t=0
until  [ $t -gt 100 ]
do
    echo "Water temperature is $t degrees Celsius."
    t=$(( t+10 ))
done
echo "The water is now boiling."
echo
echo "End of loop demonstration."
# Collected from Pavlin Georgiev
# Nov 2015
# Source: http://bash.cyberciti.biz