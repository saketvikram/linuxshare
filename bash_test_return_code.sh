!#/bin/bash

false_command
if [ $? -eq 0 ] 
then
	echo "No error"
else
	echo "Error code: $?"
fi

echo "Executing correct command"
if [ $? -eq 0 ]
then
        echo "No error"
else
        echo "Error code: $?"
fi
