#!/bin/bash

export current_date=$(date  +%d%m%y)
export log="log.log"
# function check_mem {
#   local mem=`free -h | grep Mem | awk '{print $4}'`
#   if [[ ${mem%Mi} -lt "1024" ]]; then 
#     echo "Error: too little space left"
#     exit 1
#   fi
# }

# create a folder
function name_folder {
  while [[ ${#folder_name} -lt 4 ]]; do
    folder_name=$folder_name${folder_name:0:1}
  done
  folder_name=$folder_name${folder_name: -1}
}

function name_file {
  file_name="${file_name%.*}"
  while [[ ${#file_name} -lt 4 ]]; do
    file_name=$file_name${file_name:0:1}
  done
  file_name=$file_name${file_name: -1}
}

function start {
  for ((i=0; i<$VAR2; i++)); do
    # check_mem
    name_folder
    mkdir "${path}${folder_name}_${current_date}"
    echo "Directory: ${path}${folder_name}_${current_date}" >> $log

    for ((j=0;j<$VAR4;j++));do
      # check_mem
      name_file
      fallocate -l $size"KB" "${path}${folder_name}_${current_date}"/${file_name}_${current_date}.${file_exe}
      echo "File: ${path}${folder_name}_${current_date}"/${file_name}_${current_date}.${file_exe} >> $log
    done
  done
}