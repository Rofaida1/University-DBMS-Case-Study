#!/bin/bash

export DISPLAY=:0
declare -i total
declare -i threshold

# Set your threshold values (in megabytes)
total=$(free -m |awk '/Mem:/ {print $2}')
threshold=$((80 * $total / 100 ))
#echo $threshold


while true; do
    # Get the used memory in megabytes
    
    used=$(free -m | awk '/Mem:/ {print $3}')
    # Check if memory used is greater than threshold
    if [ "$used" -gt "$threshold" ]; then
         notify-send "High RAM Usage Alert" "RAM used is ${used}Mb (Threshold is: ${threshold}Mb)"
    fi

  break
done


