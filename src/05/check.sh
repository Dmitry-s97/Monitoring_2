#!/bin/bash

function start {
  if [[ $var -eq 1 ]]; then
    cat ../04/*.log | sort -k 8
  elif [[ $var -eq 2 ]]; then
    cat ../04/*.log | awk '{print $1}' | sort -u
  elif [[ $var -eq 3 ]]; then
    cat ../04/*.log | grep -P '400|401|403|404|500|501|502|503'
  elif [[ $var -eq 4 ]]; then
    cat ../04/*.log | grep -P '400|401|403|404|500|501|502|503' | awk '{print $1}' | sort -u
  fi
}