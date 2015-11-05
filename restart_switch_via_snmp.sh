#!/bin/bash
# This script restarts a Cisco switch using its IP address
# and SNMP read/write community string
# Taking command-line parameters:
# 1st - IP of the switch
# 2nd - R/W community string

IP=$1
SNMP_RW_STR=$2

clear
echo Restarting Cisco switch with IP: $IP ...
# Syntax
# snmpset -v2c -c <R/W Community>  < IP > .1.3.6.1.4.1.9.2.9.9.0 i 2
# To use this command you need to install package net-snmp
echo snmpset -v2c -c $SNMP_RW_STR  $IP  .1.3.6.1.4.1.9.2.9.9.0 i 2

sleep 5
ping -c 100 $IP
