#!/bin/bash
# Creates DNS configuration that is shown on the screen only.
# Takes parameters from the command-line in this order:
# 1. hostname
# 2. IP address
# 3. Mail relay server
# Parameters are manadatory.

host_name=$1
ip_address=$2
mail_relay_server=$3

echo $host_name"		IN A "$ip_address
echo "		IN MX 50 "$mail_relay_server"."
# Do not remove the finals "." since it is needed by DNS
