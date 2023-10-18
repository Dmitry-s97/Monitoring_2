#!/bin/bash

function check_parameters {
  # проверка на количество параметров
  if [ "$COUNT" -ne 1 ]; then
  echo "Необходим 1 параметр для запуска скрипта"
  exit 1
  fi

  if [[ $NUM -lt 1 || $NUM -gt 3 ]]; then
  echo "Введите число от 1 до 3"
  exit 1
  fi
}