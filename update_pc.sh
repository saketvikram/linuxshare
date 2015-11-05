#!/bin/bash
log_file=$HOME/update.log
yum update -y > $log_file && less $log_file
