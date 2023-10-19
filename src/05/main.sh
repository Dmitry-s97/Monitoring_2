#!/bin/bash

if [[ $# -eq 1 ]]; then
  var=$1
  source check.sh;
  start
else
  echo "Should be one parameter"
  exit 1
fi