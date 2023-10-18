#!/bin/bash

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
  random_folder_num=`shuf -i 1-100 -n 1`
  for ((i=0; i<$random_folder_num; i++)); do
    # check_mem
    name_folder
    folder_path="$(compgen -d / | shuf -n1)"
    if [[ $folder_path == "/bin" || $folder_path == "/sbin" ]]; then
      i=$(($i + 1))
      continue
    fi
    sudo mkdir "${folder_path}/${folder_name}_${current_date}"
    echo "Directory: ${folder_path}/${folder_name}_${current_date}" >> $log
    random_file_num=`shuf -i 1-100 -n 1`
    for ((j=0;j<$random_file_num;j++));do
      # check_mem
      name_file
      sudo fallocate -l $size"Mb" ${folder_path}/${folder_name}_${current_date}/${file_name}_${current_date}.${file_exe}
      echo "File: ${folder_path}/${folder_name}_${current_date}/${file_name}_${current_date}.${file_exe}" >> $log
    done
  done
}

function write_time {
  echo "Программа запущена в ${start_time}" >> $log
  echo "Программа завершена в ${end_time}" >> $log
  echo "Общее время работы: $runtime seconds" >> $log

  echo "Программа запущена в ${start_time}"
  echo "Программа завершена в ${end_time}"
  echo "Общее время работы: $runtime seconds"
}