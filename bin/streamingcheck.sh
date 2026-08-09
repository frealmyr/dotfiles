#!/bin/bash
LOG_FILE="/var/log/streamingcheck.log"
if pgrep -f '[G]eForce' >/dev/null 2>&1; then
    /sbin/ifconfig awdl0 down
    /sbin/ifconfig llw0 down
    echo "$(date '+%Y-%m-%d %H:%M:%S') GeForce detected - awdl0/llw0 down" >> "$LOG_FILE"
else
    /sbin/ifconfig awdl0 up
    /sbin/ifconfig llw0 up
    echo "$(date '+%Y-%m-%d %H:%M:%S') GeForce not found - awdl0/llw0 up" >> "$LOG_FILE"
fi
