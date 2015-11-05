#!/bin/bash
# Prepares a new network definition ready for inserting into DHCP configuration
# DHCP config is not modified
# Parameters taken from the command-line
NETWORK_ID=$1	# Example: 147.251.102.0
NETMASK=$2	# Ex. 255.255.255.192
GW=$3	# Ex. 147.251.102.62
DOMAIN=$4	# Ex. phil.ucn.muni.cz
DNS1=$5 	# Ex. 147.251.96.33
DNS2=$6		# Ex. 147.251.19.69
NTP1=$7
NTP2=$8

echo "subnet $NETWORK_ID netmask $NETMASK {"
echo "	option routers $GW;"
echo "	default-lease-time 7200;"
echo "	max-lease-time 14400;"
echo "	option domain-name	\"$DOMAIN\";"
echo "	option domain-name-servers	$DNS1, $DNS2;"
echo "	option ntp-servers	$NTP1, $NTP2;"
echo "} # End of $NETWORK_ID"

# Author: Pavlin Georgiev
# May 2015
