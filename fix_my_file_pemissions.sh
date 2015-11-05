#!/bin/bash

# Changes the file and directory persmissions in user's home directory
cd $HOME

# Setting permissions to access dir contents to all sub-dirs recursively
# without changing file permissions
chmod -c a+X * # Capital X letter

# Setting permissions to all files and sub-dirs recursively
# User (owner) can read/write/execute, Group can read, Others can read
chmod -cR u=rwx,g=r,o=r *

# Setting permissions to access dir contents to all sub-dirs recursively
# without changing file permissions
chmod -c a+X * # Capital X letter

