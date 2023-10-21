#!/bin/bash

chmod 766 tohtml.sh 

if [[ $# -gt 0 ]]; then
  echo "No paremeters"
else
  while :
  do
  ./tohtml.sh > ./metrics/index.html
  sleep 5
  done
fi

