#!/bin/bash
# Creates configuration for a DHCP server that is shown only on the screen.
# It takes parameters from the command-line in this order:
# 1. hostname *
# 2. IP address *
# 3. MAC address *
# 4. switch name
# 5. port number
# Fields marked with * are necessary, the rest of them are supplementory

host_name=$1
ip_address=$2
mac_address=$3
switch_name=$4
port_number=$5

echo "host $host_name { #$switch_name $port_number"
echo "	hardware ethernet $mac_address;"
echo "	fixed-address $ip_address;"
echo "}"

