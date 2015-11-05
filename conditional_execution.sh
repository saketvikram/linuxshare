#!/bin/bash

# Demonstrated string comparison in BASH

#!/bin/bash
read -p "Enter a phrase: " phrase
echo
if test -z $phrase
then
	echo "You gave me an empty phrase!"
	exit 1
fi
