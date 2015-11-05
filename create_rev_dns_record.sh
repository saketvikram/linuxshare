#!/bin/bash
# Creates reverse DNS record and outputs it on the sreen.
# Takes parameters from the command-line in this order:
# 1. host name
# 2. domain name
# 3. IP address

host_name=$1
domain_name=$2
ip_address=$3

# Takes the last byte from the IP address to create reverse DNS record
last_byte=`echo $ip_address | cut -d"." -f4`

echo $last_byte"		IN PTR "$host_name"."$domain_name"."
# Do not delete the final dot at the config line. It is needed.

# Example: pc_class01 192.168.10.1 our.domain-server.com
# New reverse DNS record will be:
# 1	IN PTR pc_class01.our.domain-server.com.
