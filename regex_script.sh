#!/bin/bash

# Demonstration of regular expressions

echo There are three different versions of regular expression syntax:
echo 1. Basic
echo 2. Extened
echo 3. Perl style
echo

file=$HOME/female_names.txt
# echo Searching in a file with female names ...
# echo
# echo "Names starting with A"
# read key
# grep ^A $file
# echo
# echo "Names starting with B"
# read key
# grep ^B $file
# echo
# 
# echo "Names ending by \"ina\""
# read key
# grep ina$ $file
# echo

echo "Names staring with A and ending with a"
read key
grep -i '^a[a-z]*a$' $file
echo

echo "Short name less then 5 letters"
read key

# echo Play with work substitutions using sed and fix the phrases
# phrase="During the winter we go to the beach and have great time."
# echo $phrase
# echo
# echo "After substitution with sed"
# echo $phrase | sed -e "s/winter/summer/g"
# echo $phrase | sed -e "s/beach/mountains/g"

# Written by Pavlin Georgiev
# November 2015
