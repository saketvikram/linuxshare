#!/bin/bash
# Finds dropped packets on the firewall searching in the Linux log.
# IP address is passed like parameter on the command line.
grep fw-log-drop /var/log/messages | grep $1
