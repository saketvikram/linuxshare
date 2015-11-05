#!/bin/bash
# Testing script for different choices
clear

echo "1. Choice A"
echo "2. Choice B"
echo "3. Choice C"
echo "4. Choice D"
echo "5. Choice E"

echo -n "Please enter a choice [1..5] : "
read choice

case $choice in
'1')
	echo 'Choice A -> Opration A';;
'2')
	echo 'Choice B -> Opration B';;
'3')
	echo 'Choice C -> Opration C';;
'4')
	echo 'Choice D -> Opration D';;
'5')
	echo 'Choice E -> Opration E';;
*)
esac
