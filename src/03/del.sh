#!/bin/bash

function delete_log {
  log=`grep Directory: ../02/log.txt | awk '{print $2}'`

  for i in $log; do
    sudo rm -rf $i
    echo "$i has been deleted"
  done
}

function delete_mask {
  echo "Введите маску формата: foldername_160323"
  read mask

  prefix=$(echo $mask | awk -F"_" '{ print $1 }')
  postfix=$(echo $mask | awk -F"_" '{ print $2 }')
  sudo rm -rf $(sudo find / -type d -name "*$prefix*$postfix")
}

function delete_date {
  echo "Введите дату начала в формате: YYYY-MM-DD HH:MM"
  read start
  echo "Введите дату конца в формате: YYYY-MM-DD HH:MM"
  read end

  log=`grep Directory: ../02/log.txt | awk '{print $2}'`
  files=`sudo find / -newermt "$start" ! -newermt "$end" 2>/dev/null`
  dir=`dirname $files`
  for i in $dir; do
    for j in $files; do
      if [[ $i == $j ]]; then
        sudo rm -rf $i 2>/dev/null
      fi
    done
  done
}