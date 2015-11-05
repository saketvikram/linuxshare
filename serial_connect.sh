#!/bin/bash

# Connects through serial port to a Cisco switch (speed 9600 bps)
# and estalishes terminal connection via minicom

minicom --device=/dev/ttyUSB0
