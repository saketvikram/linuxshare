#!/bin/bash
# Searching for dropped packets on the firewall

ip_addr=$1
linux_log=/var/log/messages

grep fw-log-drop $linux_log | grep SRC=$ip_addr
