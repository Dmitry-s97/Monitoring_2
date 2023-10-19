#!/bin/bash

if [[ $# -gt 0 ]]; then
  echo "start script without parameters"
  exit 1
fi

goaccess -f ../04/1.log --log-format=COMBINED > combined.html