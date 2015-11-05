#!/bin/bash

# Copies Excel table from the local PC to a server with documentation
# Documentaion file is taken a command-line parameter.

doc_file=$1
src=/home/georgiev/Work/Projekt_AVT
dest=georgiev@kosopad:/home/cit/dokumentace/carla_avt

scp $src/$doc_file $dest

# Created on: 13 Oct 2015
