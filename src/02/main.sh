#!/bin/bash

COUNT=$#
folder_name=$1
file_name=$2
file_exe="${file_name#*.}"
size=$3

export start=$(date +%s)
export current_date=$(date  +%d%m%y)
export start_time=$(date +'%Y-%m-%d %H:%M:%S') # Cохраняем время начала выполнения скрипта
export log="log.txt"

source check_parameters.sh; command 
check_parameters
source create.sh; start

export end=$(date +%s) # Время окончания скрипта в секундах
export end_time=$(date +'%Y-%m-%d %H:%M:%S')  # Время окончания скрипта
export runtime=$(($end - $start)) # Время работы скрипта

write_time