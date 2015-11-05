#!/bin/bash

# Demonstrating shell functions

hello ()
{
   echo 'Hello world!';
}

# Taking commad-line parameters
hello2 ()
{
   local name1=$1;
   echo Name is :$1;
   echo "Hi $name1, how are you?";
}
# Example: Hi Jane, how are you?
hello3 ()
{
   local name1=$1;
   local name2=$2;
   echo "Hello $name1 and $name2 !"; 
}
# For example Hello dear friends!


# if one, two or more cmd-line params
if [ $# -eq 0 ]; then
	hello
elif [ $# -eq 1 ]; then
	hello2
elif [ $# -eq 2 ]; then
	hello3
else
	echo "Hi, everyone!"
fi
