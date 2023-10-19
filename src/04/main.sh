#!/bin/bash

if [[ $# -eq 0 ]]; then
  for ((i=1;i<=5;i++)); do
    log=$i.log
    touch $log
    num_writes=`shuf -i 100-1000 -n 1`
    my_date=`date +"%F %H:%M:%S"`
    second=1
    for ((j=0;j<num_writes;j++)); do
      times="[`date -d "$my_date ${second}"sec"" +"%d/%b/%Y:%H:%M:%S"` +0300]"
      ip="$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
      method=`shuf -n1 Methods`
      url=`shuf -n1 URL`
      code=`shuf -n1 Code`
      agent=`shuf -n1 Agents`
      size=`shuf -i 15-100 -n 1`
      echo "$ip - - ${times} \"${method} ${url} HTTP/1.1\" $code $size \"-\" \"${agent}\"" >> $log
      second=$(($second + 1))
    done
    sort -k 4 -o "$log" "$log"
  done
else 
  echo "Неверное количество аргументов. Должно быть 0"
fi

# Коды ответа
# "200" - OK
# "201" - Created
# "400" - bad request
# "401" - Unauthorized
# "403" - Forbidden
# "404" - Not Found
# "500" - Internal Server Error
# "501" - Not Implemented
# "502" - Bad Gateway
# "503" - Service Unavailable