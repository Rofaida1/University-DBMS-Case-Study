#! /usr/bin/bash
#!/bin/bash
export DISPLAY=:0
# Set the threshold for disk space (in percentage)
THRESHOLD=80

while true; do 
    # Get disk space information and extract the percentage used
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

    # Check if disk space exceeds the threshold
    if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
        # Send a notification
        notify-send "Disk Space Alert" "Disk space usage is $DISK_USAGE%. Free up space!" >> /home/faye/cron_log 2>&1


    fi

break

done

