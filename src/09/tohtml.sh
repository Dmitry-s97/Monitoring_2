#!/bin/bash

cpu=$(top -bn1 | awk '/Cpu/ { print $2}')
memfree=$(free -m | awk '/Mem/{print $3}')
diskfree=$(df /root | awk '/dev/{print $3}')

echo "# HELP process_cpu_total Total user and system CPU time spent in seconds."
echo "# TYPE process_cpu_total counter"
echo "process_cpu_total $cpu"

echo "# HELP process_free_mem Total user and system CPU time spent in seconds."
echo "# TYPE process_free_mem counter"
echo "process_free_mem $memfree"

echo "# HELP process_free_disk Total user and system CPU time spent in seconds."
echo "# TYPE process_free_disk counter"
echo "process_disk_free $diskfree"
