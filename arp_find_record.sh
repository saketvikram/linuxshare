#!/bin/bash
# Searching for the text specifiend as a command-line parameter
# Looking for the last date a device was connected to the network

cd /var/lib/arpwatch
grep $1 *
