#!/bin/bash
cpu_usage=$(mpstat 1 1 | awk '/Average:/ {print 100 - $NF}' | awk '{printf "%d\n", $1}')
space_disk=$(df -h | egrep -v "Filesystem|tmpfs" | grep "nvme0n1p15" | awk '{print $5}' | tr -d % | awk '{printf "%d\n", $1}')
memory_usage=$(free | grep Mem | awk '{print int($3/$2 * 100.00)}' | awk '{printf "%d\n", $1}')
running_processes=$(ps)
thresholds=30
        
        echo "lets check if CPU usage is healthy or not"
    if [ "$cpu_usage" -ge "$thresholds" ];
        then
                echo "Alert!! CPU usage  has crossed $thresholds%: $cpu_usage%"
        else
                echo "CPU usage is within limit: $cpu_usage%"
		fi

        echo "lets check if space disk is healthy or not"
    if [ "$space_disk" -ge "$thresholds" ];
        then
                echo "Alert!! space disk has crossed $thresholds%: $space_disk%"
        else
                echo "space disk is within limit: $space_disk%"
    fi

        echo "lets check if memory usage is healthy or not"
    if [ "$memory_usage" -ge "$thresholds" ];
        then
                echo "Alert!! memory usage has crossed $thresholds%: $memory_usage%"
        else
                echo "memory usage is within limit: $memory_usage%"
    fi
		echo "Running Processes: $running_processes"
