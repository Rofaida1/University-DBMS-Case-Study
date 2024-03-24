#!/bin/bash

export DISPLAY=:0

# Set the predefined CPU threshold (in percentage)
threshold=80

while true; do
    # Get CPU usage percentage using top command
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)

    # Compare CPU usage with the threshold using bc for floating-point comparison
    if [ "$(echo "$cpu_usage > $threshold" | bc -l)" -eq 1 ]; then
        # Send notification
        notify-send "High CPU Usage Alert" "CPU usage is $cpu_usage% (threshold: $threshold%)"
    fi


break
done

