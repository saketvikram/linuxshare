#!/bin/bash

clear
echo Demostrating arithmetic operations
var1=1
var2=2
result=$((var1 + var2))
echo $result

echo ""
x=5
y=10
answer=$(( x + y ))
echo "$x + $15 = $answer"

echo
echo "Enter two numbers"
read -p "X = " x
read -p "Y = " y
echo "Addition $x + $y = $((x + y))"
echo "Subsraction $x - $y = $((x - y))"
echo "Multiplication $x * $y = $((x * y))"
echo "Division $x / $y = $((x / y))"
echo "Modulus $x % $y = $((x % y))"

echo -n Is "$x < $y? "
test $x -lt $y && echo "Yes."
test $x -eq $y && echo "No, values are equal."
test $x -gt $y && echo "No."

echo
echo -n Is "$x * $y > 100 ? "
test $(($x * $y)) -gt 100 && echo "Yes." || echo "No." 

echo
echo -n Is "$x * $y < 10 ? "
if [ $(($x * $y)) -lt 10 ]
then
	echo Yes.
else
	echo No.
fi

echo
if [ $x -gt 0 ]; then
	echo "$x is a positive."
elif [ $x -lt 0 ]; then
	echo "$x is a negative."
elif [ $x -eq 0 ]; then
	echo "$x is zero number."
else
	echo "$x is not a number."
fi

# Written by Pavlin Georgiev
# Nov 2015
