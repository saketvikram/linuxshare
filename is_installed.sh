#!/bin/bash
# Checks if a software with specified name is installed
# The name is taken as the first command-line parameter

rpm -qa | grep -i $1
