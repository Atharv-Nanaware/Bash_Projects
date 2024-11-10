
#!/bin/bash

#############################################################
Author : Atharv
#Objective:
	#To develop a script that continuously monitors system resource usage (CPU, memory, disk, network) and sends instant alerts when usage exceeds set thresholds, ensuring system stability and preemptive issue resolution. This tool aims to streamline system monitoring by automating alert generation for efficient resource management.



# Thresholds for alerts
CPU_THRESHOLD=90
MEM_THRESHOLD=90

# Calculate CPU usage as a percentage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
# Calculate memory usage as a percentage
mem_usage=$(free | awk '/Mem:/ {print $3/$2 * 100.0}')

# Check if CPU or memory usage exceeds thresholds
if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )) || (( $(echo "$mem_usage > $MEM_THRESHOLD" | bc -l) )); then
    echo "Warning: High CPU or memory usage detected!"
    echo "CPU Usage: ${cpu_usage}%"
    echo "Memory Usage: ${mem_usage}%"
    
    # Placeholder for sending alert (e.g., email or Slack)
    send_alert() {
        # Example command to send an alert
        echo "Alert: High resource usage - CPU: ${cpu_usage}% | Memory: ${mem_usage}%"
        # Replace with actual alerting mechanism, e.g., mail, Slack API
    }
    
    send_alert
fi

