#!/bin/bash

COUNT=$#
NUM=$1

source check_parameters.sh;
check_parameters
source del.sh;

if [[ $NUM -eq 1 ]]; then
  delete_log
elif [[ $NUM -eq 2 ]]; then
  delete_date
elif [[ $NUM -eq 3 ]]; then
  delete_mask
fi