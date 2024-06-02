#!/bin/bash

# Set the threshold percentage
THRESHOLD=30

# Email configuration
EMAIL_TO="marawantarek17@gmail.com"
EMAIL_SUBJECT="Disk Space Alert"

# Get disk usage information
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if disk usage exceeds the threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    # Compose email message
    EMAIL_MESSAGE="Disk space usage on server exceeds ${THRESHOLD}%. Current usage: ${DISK_USAGE}%"

    # Send email alert using ssmtp
    echo -e "Subject: $EMAIL_SUBJECT\n\n$EMAIL_MESSAGE" | ssmtp $EMAIL_TO
fi
