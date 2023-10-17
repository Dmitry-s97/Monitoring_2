#!/bin/bash

COUNT=$#
path=$1
VAR2=$2
folder_name=$3
VAR4=$4
file_name=$5
file_exe="${file_name#*.}"
size=$6

source check_parameters.sh;
command
check_parameters
source create.sh;
start

