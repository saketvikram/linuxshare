#!/bin/bash

# Creating port configuration for Cisco switch as a text file
# Command-line parameters:
# 1. VLAN number
# 2. Port number (example: Fa0/5, Gi0/7, Gi1/0/12)
# 3. Port description (example: "Web server", "PC engineering01")

vlan_number=$1
port_number=$2
port_description=$3

echo "interface "$port_number
echo "shutdown"
echo "description "$port_description
echo "switchport access vlan "$vlan_number
echo "no shutdown"

# Written by Pavlin Georgiev
# December 2014
